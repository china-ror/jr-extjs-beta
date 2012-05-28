class <%=@cls%> < <%=@extend%>
   def initialize(options_or_url={})
       if options_or_url.instance_of? Hash
          super(options_or_url)
       elsif options_or_url.instance_of? String
          options = {:url=>options_or_url}
          super(options)
       end
   end

   def config
       if @options[:url].instance_of? Hash
          @options[:url] = Ext::Ojbect.new.url_for(@options[:url])
       end
       super
   end

   def ext
       '<%=@ext%>'
   end

end
