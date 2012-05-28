module Ext

   class Wait
      attr_accessor:title,:msg,:options
      attr_reader:var
      def initialize(title='Loading',msg='',options={})
          @title = title
          @msg = msg
          @options = options  
          @var = Ext::rand_id 
      end

      def show
          ''
      end

      def hide
          "#{@var}.hide();"
      end

      def error
          "alert('Status: ' + res.status + ' ' + res.statusText);#{hide}"
      end
  
      def wait_script
          "var #{@var}=#{Ext::Msg::wait(@msg,@title,@options).script}"
      end
   end

   class LoadMask < Ext::Object
      attr_reader:var,:target
      def initialize(options={},target='Ext.getBody()')
          super(options)
          @target = target
          @var = Ext::rand_id
      end

      def show
          "#{@var}.show();"
      end
    
      def hide
          "#{@var}.hide();"
      end

      def error
          "alert('Status: ' + res.status + ' ' + res.statusText);#{hide}"
      end

      def script
          "var #{@var}=new Ext.LoadMask(#{@target},#{@options.json.script});"
      end 
  
      def wait_script
          script
      end

   end

end

