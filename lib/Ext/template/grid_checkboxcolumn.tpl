class <%=@cls%> < <%=@extend%>
  
  attr_reader:grid_id 
  def initialize(grid_id,options={})
      super(options)
      @grid_id = grid_id
      js = "var grid=Ext.getCmp('#{@grid_id}');var row = e.getTarget('.x-grid3-row');var index = row.rowIndex;var selMod = grid.getSelectionModel();if(selMod && selMod.isSelected(index)){selMod.deselectRow(index);}else{selMod.selectRow(index, true);selMod.grid.getView().focusRow(index);}"
      @options[:onMouseDown] = js
  end

  def ext
      '<%=@ext%>'
  end
  
end
