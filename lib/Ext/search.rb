class Search
  
  LOGICALS = {
               :eq      =>  '#{column} = ?',
               :ne      =>  '#{column} <> ?',
               :gt      =>  '#{column} > ?',
               :lt      =>  '#{column} < ?',
               :ge      =>  '#{column} >= ?',
               :le      =>  '#{column} <= ?',
               :any     =>  '#{column} LIKE ?',
               :starts  =>  '#{column} LIKE ?',
               :ends    =>  '#{column} LIKE ?',
               :between =>  '#{column} BETWEEN ? AND ?',
               :in      =>  '#{column} IN (?)',
               :ni      =>  '#{column} NOT IN (?)'
           }

  KEY_REGEX = /(eq|ne|gt|lt|ge|le|any|starts|ends|between|in|ni){1}_(\w+)_(for)_(\w+)/

  attr_reader:tables,:fields,:search_hash,:searchs,:where,:params

  def initialize(search_hash={})
      @searchs = HashWithIndifferentAccess.new
      @search_hash = search_hash || HashWithIndifferentAccess.new
      @tables = []
      @fields = []
      init_search_hash
  end

  def generate(and_or='AND',&block)
      skip_keys = []
      searchs_clone = @searchs.clone
      free_where = block.call if block
      if not free_where.blank?
         skip_keys = free_where.scan(KEY_REGEX).collect { |skip| skip.join('_') }
         searchs_clone.delete_if {|k,v| skip_keys.include?(k.to_s)}
      end
      @where = (([free_where].concat(searchs_clone.keys).delete_if{|v| v.blank?}).join(" #{and_or} ") || '').strip
      if not @where.blank?
         @where.insert(0,'(')
         @where.insert(-1,')')
      end
      @params = []
      @where.gsub!(KEY_REGEX) do |m|
          opt = @searchs[m]
          if opt
             oper = opt[:oper]
             table = opt[:table]
             field = opt[:field]
             value = opt[:value]
             column = "#{ActiveRecord::Base.connection.quote_table_name(table)}.#{ActiveRecord::Base.connection.quote_column_name(field)}"
             case oper
             when :any then
                value = "%#{value}%"
                @params << value
             when :starts then
                value = "#{value}%"
                @params << value
             when :ends then
                value = "%#{value}"
                @params << value
             when :in then
                @params << in_fun(value)
             when :ni then
                @params << ni(value)
             when :between then
                bw= between(value)
                oper = bw.first
                value = bw.last
                if oper == :between
                   @params.concat value
                else
                   @params << value
                end
             else
                @params << value
             end
             eval('"' + LOGICALS[oper] + '"')
           else
             '1 = 1'
           end
      end
      if @where.blank?
        []
      else
        [@where].concat @params
      end
  end

  protected
  def in_fun(value)
      new_value = value
      if value.instance_of?(Array)
         new_value.delete_if{|v| v.blank?}
      else
         new_value = [value]
      end
      new_value
  end

  def ni(value)
      in_fun(value)
  end

  def between(value)
      oper = :between
      new_value = value
      if value.instance_of?(Array)
         case value.size
         when 1 then
           oper = :eq
           new_value = value.first 
         when 2 then
           if(value.first.blank? and not value.last.blank?)
              oper = :le
              new_value = value.last 
           end
           if(not value.first.blank? and value.last.blank?)
              oper = :ge
              new_value = value.first 
           end
         else
           oper = :in
           new_value.delete_if {|v| v.blank?}
         end        
      else
         oper = :eq
      end
      [oper,new_value]
  end

  def init_search_hash
      @search_hash.each do |arr|
           kr = arr[0].to_s.scan(KEY_REGEX).first
           if kr
              value = arr[1]
              if not [value].join.blank?
                 table = kr.last.downcase
                 @tables << table
                 @fields << "#{kr.last}.#{kr[1]}"
                 value.strip! if value.instance_of?(String)
                 @searchs[arr[0]] = {:value=>value,:table=>table,:field=>kr[1].downcase,:oper=>kr.first.to_sym}
              end
           end
      end
      @tables.uniq!
      @fields.uniq!
  end

end
