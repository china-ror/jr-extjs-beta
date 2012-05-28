module Ext
  class Json < HashWithIndifferentAccess
 
       def initialize(hash={})
           super
           self.update(hash)
       end
    
       def script(first=[],last=[])
           s = ''
           keys = self.keys - first - last
           (first + keys + last).each do |key|
                value = self[key]
                s << escape(key,value) << ','
           end
           s = s.chop
           s.insert(0,'{')
           s.insert(-1,'}')
       end
 
    
       protected
       def base_type? value
           value.class.ancestors.detect do |ance|
                [BigDecimal,Bignum,Fixnum,Float,TrueClass,FalseClass].include? ance 
           end
       end

       def escape(key,value)
           debug << "#{parse key}:#{parse value}"
       end

       def debug
           if EXT_DEBUG
              "\n"
           else
              ''
           end
       end

       def parse target
           ances = target.class.ancestors
           if ances.include? NilClass
    		    'null'
    	   elsif ances.include? Ext::Object
    	   		target.script
    	   elsif ances.include? Ext::Json
    	   		target.script
           elsif ances.include? ActiveRecord::Base
                        target.attributes.json.script
    	   elsif ances.include? Ext::JavaScript
    	   		target.script
    	   elsif ances.include? Array
    	  			s = ''
                                size = target.size
			        size.times.each do |i| 
			           s << parse(target[i])
                                   s << ',' << debug if i < size - 1 
			        end 
			        s.insert(0,'[')
			        s.insert(-1,']')
    	   elsif base_type? target
    	  		target.to_s
    	   elsif ances.include? Hash
	          s = ''
    	  	  target.keys.each do |key|
    	  	      value = target[key]
    	  	      s << escape(key,value) << ','
    	  	  end
    	  	  s = s.chop
    	  	  s.insert(0,'{')
    	  	  s.insert(-1,'}')
    	   elsif ances.include? String
    	         target.escape_str
    	   elsif ances.include? Symbol
    	         target.to_s.escape_str
           else
                 target.to_s.escape_str
    	   end    	  
      end
  end

end

