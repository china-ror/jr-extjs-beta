module I18N

  LOCALES = {}
 
  def self.load_locales(path=nil)
      Dir[path + '/locales/*.rb'].each do |rb|
         LOCALES.update(File.basename(rb,'.rb')=>eval(File.new(rb,'r').read.strip))
      end 
  end

  def self.t(key,locale='default')
      (LOCALES[locale] || {})[key] || "#{key}.#{locale}"
  end

end
