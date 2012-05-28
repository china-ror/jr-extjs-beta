module Ext 
 class Object
    include ActionView::Helpers::AssetTagHelper 
    include ActionView::Helpers::UrlHelper
    include ActionController::UrlWriter
    include ActionView::Helpers::NumberHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::TagHelper

    attr_accessor :options
    def initialize(options={})
        @options = options
        init_default_url_options
    end
    
    def init_default_url_options
        if request
           default_url_options[:protocol] = request.env['rack.url_scheme']
           default_url_options[:host] = request.env['SERVER_NAME']
           default_url_options[:port] = request.env['SERVER_PORT'] if not request.env['SERVER_PORT'].eql?('80')
           default_url_options[:controller] = controller.controller_name
           default_url_options[:action] =  controller.action_name
        else
           default_url_options[:protocol] = 'http'
           default_url_options[:host] = 'www.jrails.org'
           default_url_options[:controller] = 'helps'
           default_url_options[:action] =  'index'
        end
    end

    def set(opt={})
        @options.update opt
    end 

    def get(key)
        @options[key]
    end

    def rm(key)
        @options.delete key
    end

    def include? key
        @options.include? key 
    end
  
    def keys
        @options.keys
    end

    def global
        Global.new
    end

    def controller

    end

    def session

    end

    def request

    end
    
    def h(text)
        ERB::Util::h(text)
    end 

    def t(key)
        global.t(key)
    end

    def config
        @options.json.script
    end
 
    def ext
        'Object' 
    end

    def script
        ("new #{ext}(#{config})")
    end

  end
end
