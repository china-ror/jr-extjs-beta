class <%=@cls%> < <%=@extend%>
   def initialize(options={})
       super(options)
       @options[:storeId] = "Store#{Ext::rand_id}" if not @options[:storeId]
   end

   def mgr_lookup
       ("Ext.StoreMgr.lookup('" << @options[:storeId] << "')").to_js
   end

   def config
       if @options[:url].instance_of? Hash
          @options[:url] = Ext::Object.new.url_for(@options[:url])
       end
       super
   end

   def ext
       '<%=@ext%>'
   end
  
   def self.load(store_id,form_id)
        "Ext.StoreMgr.lookup('#{store_id}').load({'params':Ext.getCmp('#{form_id}').getForm().getFieldValues()});".to_fn
   end   

end
