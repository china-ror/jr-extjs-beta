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

  def copy(key,*to_keys)
      to_keys.each do |to_key|
          @params[to_key] = @params[key]
      end
  end 

  def formats(frees=nil)
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
          oper = opt[:oper]
          table = opt[:table]
          field = opt[:field]
          column = "#{ActiveRecord::Base.connection.quote_table_name(table)}.#{ActiveRecord::Base.connection.quote_column_name(field)}"
          case oper
          when :eq then

          when :ne then

          else

          end
          sqlparams << opt[:value]
          eval('"' + LOGICALS[oper] + '"')
      end
      {:params=>sqlparams,:conds=>formats}
  end

  protected
  def init_params
      @params.each do |param|
           kr = param[0].to_s.scan(KEY_REGEX).first
           if kr
              @tables << kr.last
              @fields << "#{kr.last}.#{kr[1]}"
              @searchs[param[0]] = {:value=>param[1],:table=>kr.last,:field=>kr[1],:oper=>kr.first.to_sym}
           end
      end
      @tables.uniq!
      @fields.uniq!
  end

  def class_exist?(cls)
       eval("defined?(#{cls}) && #{cls}.is_a?(Class)") == true
  end

end
