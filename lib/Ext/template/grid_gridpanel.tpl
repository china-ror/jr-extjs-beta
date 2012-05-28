class <%=@cls%> < <%=@extend%>
   
  def config
      @options.json.script([:store],[])
  end

  def ext
      '<%=@ext%>'
  end
  
end

