class Search
  
  attr_reader:table_name,:conditions,:params,:operator,:format
  def initialize(table_name)
      @table_name = table_name.to_s
      @format = yield
  end

end
