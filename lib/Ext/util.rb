module Ext

  def self.rand_id
      id = '_'
      4.times do
          r = rand(255).to_s(16)
          id << ('0'*(2-r.size)) << r  
      end
      id
  end
  
end


def fn(*args)
    Ext::function(*args){yield}
end
