module Ext
  module Send
    module String
      ESCAPED_CHARS = {
           "\x00" => '\u0000', "\x01" => '\u0001', "\x02" => '\u0002',
           "\x03" => '\u0003', "\x04" => '\u0004', "\x05" => '\u0005',
           "\x06" => '\u0006', "\x07" => '\u0007', "\x0B" => '\u000B',
           "\x0E" => '\u000E', "\x0F" => '\u000F', "\x10" => '\u0010',
           "\x11" => '\u0011', "\x12" => '\u0012', "\x13" => '\u0013',
           "\x14" => '\u0014', "\x15" => '\u0015', "\x16" => '\u0016',
           "\x17" => '\u0017', "\x18" => '\u0018', "\x19" => '\u0019',
           "\x1A" => '\u001A', "\x1B" => '\u001B', "\x1C" => '\u001C',
           "\x1D" => '\u001D', "\x1E" => '\u001E', "\x1F" => '\u001F',
           "\010" =>  '\b',
           "\f"   =>  '\f',
           "\n"   =>  '\n',
           "\r"   =>  '\r',
           "\t"   =>  '\t',
           '"'    =>  '\"',
           '\\'   =>  '\\\\',
           '>'    =>  '\u003E',
           '<'    =>  '\u003C',
           '&'    =>  '\u0026' }

      def escape_str
          s = self.
                gsub(/[\x00-\x1F"\\]/) { |s| ESCAPED_CHARS[s] }.
                gsub(/([\xC0-\xDF][\x80-\xBF]|
                     [\xE0-\xEF][\x80-\xBF]{2}|
                     [\xF0-\xF7][\x80-\xBF]{3})+/nx) { |s|
                s.unpack("U*").pack("n*").unpack("H*")[0].gsub(/.{4}/n, '\\\\u\&')
          }
          "\"#{s}\""
          #"\"#{ERB::Util.h(self)}\""
      end

      def to_js
          JavaScript.new self
      end

      def to_fn(*args)
          to_js.to_fn(args)
      end
        
    end #end String

    module NilClass
      def escape_str
          ''
      end
      def to_js
          'null'.to_js
      end

      def to_fn(*args)
          ''.to_js.to_fn(args)
      end

      def json
          {}.json
      end
    end #end NilClass
    
    module Hash
      def json
          Json.new(self)
      end
    end

    module Action
      def global_filter
           @@global = Global.new({},self)
           ActionController::Base.class_eval do
                def global
                    @@global
                end
           end
           Ext::RecordForm.class_eval do
                def global
                    @@global
                end
           end
           ApplicationHelper.module_eval do
                def global
                    @@global
                end

                def t(key)
                    global.t(key)
                end
           end
           ActiveRecord::Base.class_eval do
                def global
                    @@global
                end
                def self.global
                    @@global
                end 
           end
           Ext::Object.send(:include,Module.new do
                Ext::Object.remove_possible_method 'global'
                Ext::Object.remove_possible_method 'controller'
                Ext::Object.remove_possible_method 'session'
                Ext::Object.remove_possible_method 'request'
                def global
                    @@global
                end
                def controller
                    @@global.controller
                end
                def session
                    @@global.session
                end
                def request
                    @@global.request
                end
           end)
           if EXT_DEBUG
              Ext::Init.load_locales
              Ext::Init.load_uis
              Ext::Init.include_helper
           end
      end

      def global
          @@global
      end

      def t(key)
          global.t(key)
      end
 
      def ext_render(ext)
          sc = ''
          ances = ext.class.ancestors
          if ances.include? Ext::Object
             sc = ext.script
          elsif ances.include? Ext::Json
             sc = ext.script
          elsif ances.include? Ext::JavaScript
             sc = ext.script
          elsif ances.include? Hash
             sc = ext.json.script
          else
             sc = ext.to_s
          end  
          self.render :text=>sc   
      end
    end #end Action

  end #end Send 
end #end last

String.send(:include,Ext::Send::String)
NilClass.send(:include,Ext::Send::NilClass)
Hash.send(:include,Ext::Send::Hash)
ActionController::Base.send(:include,Ext::Send::Action)
ActionController::Base.before_filter :global_filter
