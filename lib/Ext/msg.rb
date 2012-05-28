module Ext
  module Msg

    def self.alert(title,msg,fn=nil,scope='this')
        js = "Ext.Msg.alert(#{title.escape_str},#{msg.escape_str}"
        if fn
          js << ",function(){#{fn.to_js.script}}"
        else
          js << ',null'
        end
        js << ",#{scope.to_js.script});"
        JavaScript.new js
    end

    def self.prompt(title,msg,fn=nil,scope='this',multiline=false,value=nil)
        js = "Ext.Msg.prompt(#{title.escape_str},#{msg.escape_str}"
        if fn
          js << ",function(btn,text){#{fn.to_js.script}}"
        else
          js << ',null'
        end
        js << ",#{scope.to_js.script}"
        js << ",#{multiline}"
        js << ",#{value.escape_str}"
        js << ');'
        JavaScript.new js 
    end

    def self.confirm(title,msg,fn=nil,scope='this')
        js = "Ext.Msg.confirm(#{title.escape_str},#{msg.escape_str}"
        if fn
          js << ",function(btn,text){#{fn.to_js.script}}"
        else
          js << ',null'
        end
        js << ",#{scope.to_js.script});"
        JavaScript.new js
    end

    def self.show(option={})
        JavaScript.new "Ext.Msg.show(#{option.json.script});"
    end

    def self.wait(msg,title,options={})
        JavaScript.new "Ext.Msg.wait(#{msg.escape_str},#{title.escape_str},#{options.json.script});" 
    end

  end
end

