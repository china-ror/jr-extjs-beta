EvalCls = Module.new do

   def self.define_exts
       EXT_CLS.each do |ec|
          eval_cls_for ec
       end
   end
  
   def self.class_exist?(cls)
       eval("defined?(#{cls}) && #{cls}.is_a?(Class)") == true
   end
   
   def self.module_exist?(mod)
       begin
          eval("#{mod}.is_a?(Module)") == true
       rescue => e
          Rails.logger.error e.message
          false
       end
   end
   
   def self.eval_cls_for(map)
       class_exist = class_exist?(map[:class])
       extend_exist = class_exist?(map[:extend])
       if not class_exist
          if extend_exist
             eval(define_cls(map))
          else
               eval_cls_for(map_for(:class,map[:extend]))
               eval_cls_for(map_for(:class,map[:class]))
          end
       end
   end

   def self.define_cls(map)
       @names = map[:class].split('::')
       @mod_names = @names[0..-2]
       @cls = @names[-1]
       @extend = map[:extend]
       @ext = map[:ext]
       @xtype = map[:xtype]
       clstr = ''
       @mod_names.each do |mod|
            clstr << "module #{mod} \n"
       end
       tpl_name = "#{@names[1..-1].join('_').downcase}.tpl"
       tpl_path = "#{EXT_LIB_PATH}Ext/template/#{tpl_name}"
       tpl = ''
       if File.exist?(tpl_path)
          tpl = File.new(tpl_path,'r').read
       else
            tpl = %q{
              class <%=@cls%> < <%=@extend%>
                  def ext
                      '<%=@ext%>'
                  end
              end
            }
       end
       erb = ERB.new tpl
       clstr << erb.result(binding)
       @mod_names.size.times do |i|
          clstr << "end \n"
       end
       #if EXT_DEBUG
       #   Rails.logger.info '-------------------'
       #   Rails.logger.info clstr
       #end
       clstr
   end

   def self.map_for(k,v)
       EXT_CLS.detect do |ec|
           ec[k].eql? v
       end
   end

end

