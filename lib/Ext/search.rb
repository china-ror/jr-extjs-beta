class Search
  
  LOGICALS = {
               :eq      =>  '#{field} = ?',
               :ne      =>  '#{field} <> ?',
               :gt      =>  '#{field} > ?',
               :lt      =>  '#{field} < ?',
               :ge      =>  '#{field} >= ?',
               :le      =>  '#{field} <= ?',
               :any     =>  '#{field} LIKE ?',
               :starts  =>  '#{field} LIKE ?',
               :ends    =>  '#{field} LIKE ?',
               :between =>  '#{field} BETWEEN ? AND ?',
               :in      =>  '#{field} IN (?)',
               :ni      =>  '#{field} NOT IN (?)'
           }

  KEY_REGEX = /(eq|ne|gt|lt|ge|le|any|starts|ends|between|in|ni){1}_(\w+)_(for)_(\w+)/

  attr_reader:tables,:fields,:search_params,:params,:conds,:init_search
  attr_accessor:formats,:access,:not_access

  def initialize(search_params={})
      @search_params = search_params || {}
      @init_search = {}
      @tables = []
      @fields = []
      @params = []
      @conds = ''
      init_search_params
  end

  def copy(key,*to_keys)
      to_keys.each do |to_key|
          @search_params[to_key] = @search_params[:key]
      end
  end  

  def parse(operator='AND')
      skip_keys = []
      if @formats
         skip_keys = @formats.scan(KEY_REGEX).collect { |skip| skip.join('_') }
      else
         @formats = ''
      end
      search_params_clone = @search_params.clone
      search_params_clone.delete_if {|k,v| skip_keys.include?(k.to_s)}
      @formats << " #{operator} " if not @formats.blank?

      auto_formats << (search_params_clone.collect { |param| param[0] }).join(" #{operator} ")
      keys = []
      if @access or @not_access
         keys = auto_formats.scan(KEY_REGEX).collect {|key| key.join('_')}
      end
      if @access
         #raise "#{keys.inspect} not exist access keys!"
      end
      if @not_access

      end
      @formats << auto_formats 
      @formats.insert(0,'(')
      @formats.insert(-1,')')
  end

  protected
  def init_search_params
      @search_params.each do |search_param|
           @init_search[search_param[0]] = {:value=>search_param[1],:table=>'',:field=>'',:oper=>''}
      end
  end

end
