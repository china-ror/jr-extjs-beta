  class Template < Ext::Object
   
    attr_reader:htmls 
    def initialize(htmls=[],options={})
        super(options)
        @htmls = htmls
    end
 
    def ext
        'Ext.Template'
    end
    
    def html_arrays
        (@htmls.collect do |html|
            html.escape_str
        end).join(',')  
    end

    def script
        ha = html_arrays
        ("new #{ext}(#{ha.blank? ? '""' : ha},#{config})")
    end

  end
