class Search
  
  OPERS = {
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

   COND_REGEX = /(eq|ne|gt|lt|ge|le|any|starts|ends|between|in|ni){1}_(\w+)_(for)_(\w+)/

  attr_reader:tables,:fields,:search_params,:params,:conds,:init_search
  attr_accessor:formats,:access

  def initialize(search_params={})
      @search_params = search_params
      @init_search = {}
      init_search_params
  end

  def copy(key,*to_keys)
      to_keys.each do |to_key|
          @search_params[to_key] = @search_params[:key]
      end
  end  

  def parse
      if @formats
         skip_keys = @formats.scan(COND_REGEX).collect do |skip|
                          skip.join('_')
                     end
      else
         @formats = (@search_params.collect do |param| 
                          param[0]
                    end).join(' AND ')
      end
  end

  protected
  def init_search_params
      @search_params.each do |search_param|
           @init_search[search_param[0]] = {:value=>search_param[1],:table=>'',:field=>'',:oper=>''}
      end
  end

end
