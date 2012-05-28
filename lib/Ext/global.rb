class Global
   attr_accessor:options
   attr_reader:controller,:session,:request
   def initialize(options={},controller=nil)
       @options = options
       @options[:locale] = (@options[:locale] || 'default')
       @controller = controller
       if @controller
          @session = @controller.session
          @request = @controller.request
       end
   end

   def t(key)
       if @options[:locale]
          I18N.t(key,@options[:locale])
       else
          I18N.t(key)
       end
   end
 
end

