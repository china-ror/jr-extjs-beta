module Ext
  class JavaScript
     attr_accessor :script
     def initialize(string)
         if string.nil?
            @script = 'null'
         else
            @script = string
         end
     end

     def to_fn(*args)
         Ext::function(*args){@script}
     end
  end

  def self.function(*args)
    s = nil
    if yield.nil?
       s = '' 
    elsif yield.class.ancestors.include? Ext::JavaScript
         s = yield.script
    else
         s = yield
    end
    ("function(#{args.join(',')}){" << s << '}').to_js
  end
  
  module Items
    def self.add(id,cmp,dolay)
        rid = Ext::rand_id
        s = "var #{rid}=Ext.getCmp('#{id}');"
        s << "#{rid}.add(#{cmp.script});"
        s << "#{rid}.doLayout();" if dolay
        s
    end

    def self.insert(id,index,cmp,dolay=false)
        rid = Ext::rand_id
        s = "var #{rid}=Ext.getCmp('#{id}');"
        s << "#{rid}.insert(#{index},#{cmp.script});"
        s << "#{rid}.doLayout();" if dolay
        s
    end

    def self.update(id,index_or_id,cmp,dolay=false)
        rid = Ext::rand_id
        s = "var #{rid}=Ext.getCmp('#{id}');"
        if index_or_id.instance_of? Fixnum
           s << "#{rid}.remove(#{rid}.get(#{index_or_id}));"
           s << "#{rid}.insert(#{index_or_id},#{cmp.script});"
        else
           ind = Ext::rand_id
           s << "var #{ind}=#{rid}.items.indexOf(Ext.getCmp('#{index_or_id}'));"
           s << "#{rid}.insert(#{ind},#{cmp.script});"
        end
        s << "#{rid}.doLayout();" if dolay
        s 
    end
   
    def self.hide(id)
        "Ext.getCmp('#{id}').hide();"
    end
    
    def self.remove(id,index_or_id)
        rid = Ext::rand_id
        s = "var #{rid}=Ext.getCmp('#{id}');"
        if index_or_id.instance_of? Fixnum
           s << "#{rid}.remove(#{rid}.get(#{index_or_id}));" 
        else
           s << "#{rid}.remove('#{index_or_id}')"
        end
        s 
    end

    def self.removes(id)
        "Ext.getCmp('#{id}').removeAll();"
    end
  
    def self.destroy(id)
        "Ext.getCmp('#{id}').destroy();"
    end
    
  end

end
  

