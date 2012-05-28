module Ext
  module Init
    
    def self.include_helper
        (Dir["#{RAILS_ROOT}/app/ui/**/**/"].drop 1).each do |dir|
             base_name = File.expand_path(dir).split('/').last
             camel_name = base_name.camelcase
             helper_name = "#{camel_name}Helper"
             Dir["#{dir}**/*.rb"].each do |rb|
                 ui_cls = File.basename(rb, ".rb").camelcase
                 if EvalCls.class_exist? ui_cls
                    incstr = "#{ui_cls}.module_eval do \n"
                    incstr << "include ApplicationHelper \n" if EvalCls.module_exist?('ApplicationHelper')
                    incstr << "include #{helper_name} \n" if EvalCls.module_exist?(helper_name)
                    incstr << 'end'
                    eval(incstr)
                 end
             end
        end
    end

    def self.define_exts
        EvalCls.define_exts
    end

    def self.load_uis
        Dir["#{RAILS_ROOT}/app/ui/**/*.rb"].each do |file|
           load "#{File.dirname(file)}/#{File.basename(file)}"
        end
    end

    def self.load_locales
        I18N.load_locales RAILS_ROOT
    end

  end
end
