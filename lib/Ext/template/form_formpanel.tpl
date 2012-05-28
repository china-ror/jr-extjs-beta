class <%=@cls%> < <%=@extend%>
    attr_accessor:valid_error
    def initialize(options={})
        super(options)
        @options[:formId] = "formId#{Ext::rand_id}"
        @valid_error = ''
    end

    def ext
        '<%=@ext%>'
    end

end

