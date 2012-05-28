module Ext
  class RecordForm
    
    attr_reader :global,:active_record
    def initialize(active_record)
        @active_record = active_record
    end

    def check_box(attr,options={})
        init_options(attr,options)
        options[:checked] = options[:inputValue].eql?(options[:value])
        Ext::Form::CheckBox.new(options)
    end

    def combo_box(attr,options={})
        init_options(attr,options)
        Ext::Form::ComboBox.new(options)
    end

    def composite_field(attr,options={})
        Ext::Form::CompositeField.new(options)
    end 

    def date_field(attr,options={})
        init_options(attr,options)
        Ext::Form::DateField.new(options)
    end

    def display_field(attr,options={})
        init_options(attr,options)
        Ext::Form::DisplayField.new(options)
    end

    def hidden(attr,options={})
        init_options(attr,options)
        Ext::Form::Hidden.new(options)
    end

    def html_editor(attr,options={})
        init_options(attr,options)
        Ext::Form::HtmlEditor.new(options)
    end

    def label(attr,options={})
        Ext::Form::Label.new(options)
    end

    def number_field(attr,options={})
        init_options(attr,options)
        Ext::Form::NumberField.new(options)
    end

    def radio(attr,options={})
        init_options(attr,options)
        options[:checked] = options[:inputValue].eql?(options[:value])
        Ext::Form::Radio.new(options)
    end

    def text_area(attr,options={})
        init_options(attr,options)
        Ext::Form::TextArea.new(options)
    end

    def text_field(attr,options={})
        init_options(attr,options)
        Ext::Form::TextField.new(options)
    end

    def time_field(attr,options={})
        init_options(attr,options)
        Ext::Form::TimeField.new(options)
    end

    def trigger_field(attr,options={})
        init_options(attr,options)
        Ext::Form::TiggerField.new(options)
    end
   
    protected 
    def init_options(attr,options)
        model_name = @active_record.class.name
        options[:name] = "#{model_name}[#{attr}]"
        options[:id] = "#{model_name}_#{attr}" if not options[:id]
        options[:value] = @active_record[attr]
        if not options[:fieldlabel]
          _name = model_name.titlecase.downcase.gsub(' ','_')
          options[:fieldlabel] = global.t("#{_name}_#{attr}".to_sym)
        end
    end

  end
end

