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

  attr_reader:tables,:fields,:params,:searchs

  def initialize(params={})
      @searchs = HashWithIndifferentAccess.new
      @params = params || HashWithIndifferentAccess.new
      @tables = []
      @fields = []
      init_params
  end

  def generate(frees=nil)
      skip_keys = []
      formats = ''
      searchs_clone = @searchs.clone
      if not frees.blank?
         skip_keys = frees.scan(KEY_REGEX).collect { |skip| skip.join('_') }
         searchs_clone.delete_if {|k,v| skip_keys.include?(k.to_s)}
         formats << frees
      end
      autos = searchs_clone.keys.join(' AND ')
      if not autos.blank?
         formats << ' AND ' if not frees.blank? 
         formats << autos
      end
      if not formats.blank?
         formats.insert(0,'(')
         formats.insert(-1,')')
      end
      sqlparams = []
      formats.gsub!(KEY_REGEX) do |m|
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
                sqlparams << value
             when :starts then
                value = "#{value}%"
                sqlparams << value
             when :ends then
                value = "%#{value}"
                sqlparams << value
             when :between then
                bw= between(value)
                oper = bw.first
                value = bw.last
                if oper == :between
                   sqlparams.concat value
                else
                   sqlparams << value
                end
             else
                sqlparams << value
             end
             eval('"' + LOGICALS[oper] + '"')
           else
             '1 = 1'
           end
      end
      if formats.blank?
        []
      else
        [formats].concat sqlparams
      end
  end

  protected
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
         end        
      else
         oper = :eq
      end
      [oper,new_value]
  end

  def init_params
      @params.each do |param|
           kr = param[0].to_s.scan(KEY_REGEX).first
           if kr
              value = param[1]
              if not [value].join.blank?
                 @tables << kr.last
                 @fields << "#{kr.last}.#{kr[1]}"
                 @searchs[param[0]] = {:value=>value,:table=>kr.last,:field=>kr[1],:oper=>kr.first.to_sym}
              end
           end
      end
      @tables.uniq!
      @fields.uniq!
  end

  def class_exist?(cls)
       eval("defined?(#{cls}) && #{cls}.is_a?(Class)") == true
  end

end
