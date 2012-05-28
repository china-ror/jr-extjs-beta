module Ext
  module Ajax

     def self.request(options_or_url={},wait=nil)
         options = {}
         if options_or_url.instance_of? Hash
            options = options_or_url
         elsif options_or_url.instance_of? String
            options[:url] = options_or_url
         else
            raise 'Option only be hash or string for url!'
         end
         js = ''
         hide_wait = ''
         error_wait = ''
         if wait
            js << wait.wait_script
            js << wait.show
            hide_wait = wait.hide
            error_wait = wait.error
         end
         if options[:url].instance_of? Hash
            options[:url] = Ext::Object.new.url_for(options[:url])
         end
         if(not options[:callback])
           options[:callback] = Ext::function(:opt,:suc,:res) {"if(res.status == 200){eval(res.responseText);}#{hide_wait}"}
           if wait
              options[:failure] ||= error_wait.to_fn(:res,:opt)
           else
              options[:failure] ||= ("alert('Status: ' + res.status + ' ' + res.statusText);".to_fn(:res,:opt))
           end
         end
         js << "Ext.Ajax.request(#{options.json.script});"
         JavaScript.new js
     end

     def self.submit(form,options_or_url={},wait=nil)
         options = {}
         if options_or_url.instance_of? Hash
            options = options_or_url
         elsif options_or_url.instance_of? String
            options[:url] = options_or_url
         else
            raise 'Option only be hash or string for url!' 
         end
         options[:method] ||= 'POST'
         options[:form] = form.get(:formId)
         "if(Ext.getCmp('#{form.id}').getForm().isValid()){#{Ext::Ajax::request(options,wait).script}}else{#{form.valid_error}}"
     end

  end 
  
end

