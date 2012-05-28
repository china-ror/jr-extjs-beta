class <%=@cls%> < <%=@extend%>
   attr_reader:id
   def initialize(options={})
       super(options)
       @options[:id] = (self.class.name.split('::').last << Ext::rand_id) if not @options[:id]
       @id = @options[:id]
   end

   def show
       (script() << '.show();')
   end

   def ext
       '<%=@ext%>' 
   end
end
