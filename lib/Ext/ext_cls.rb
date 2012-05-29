EXT_CLS = [
            {:class=>'Ext::Util::Observable',:extend=>'Ext::Object',:ext=>'Ext.util.Observable'},
            {:xtype=>'box',:class=>'Ext::BoxComponent',:extend=>'Ext::Component',:ext=>'Ext.BoxComponent'},
            {:xtype=>'button',:class=>'Ext::Button',:extend=>'Ext::BoxComponent',:ext=>'Ext.Button'},
            {:xtype=>'buttongroup',:class=>'Ext::ButtonGroup',:extend=>'Ext::Panel',:ext=>'Ext.ButtonGroup'},
            {:xtype=>'colorpalette',:class=>'Ext::ColorPalette',:extend=>'Ext::Component',:ext=>'Ext.ColorPalette'},
            {:xtype=>'component',:class=>'Ext::Component',:extend=>'Ext::Util::Observable',:ext=>'Ext.Component'},
            {:xtype=>'container',:class=>'Ext::Container',:extend=>'Ext::BoxComponent',:ext=>'Ext.Container'},
            {:xtype=>'cycle',:class=>'Ext::CycleButton',:extend=>'Ext::SplitButton',:ext=>'Ext.CycleButton'},
            {:xtype=>'dataview',:class=>'Ext::DataView',:extend=>'Ext::BoxComponent',:ext=>'Ext.DataView'},
            {:xtype=>'datepicker',:class=>'Ext::DatePicker',:extend=>'Ext::Component',:ext=>'Ext.DatePicker'},
            {:xtype=>'editor',:class=>'Ext::Editor',:extend=>'Ext::Component',:ext=>'Ext.Editor'},
            {:xtype=>'editorgrid',:class=>'Ext::Grid::EditorGridPanel',:extend=>'Ext::Grid::GridPanel',:ext=>'Ext.grid.EditorGridPanel'},
            {:xtype=>'flash',:class=>'Ext::FlashComponent',:extend=>'Ext::Panel',:ext=>'Ext.FlashComponent'},
            {:xtype=>'grid',:class=>'Ext::Grid::GridPanel',:extend=>'Ext::Panel',:ext=>'Ext.grid.GridPanel'},
            {:xtype=>'listview',:class=>'Ext::ListView',:extend=>'Ext::DataView',:ext=>'Ext.ListView'},
            {:xtype=>'multislider',:class=>'Ext::Slider::MultiSlider',:extend=>'Ext::BoxComponent',:ext=>'Ext.slider.MultiSlider'},
            {:xtype=>'panel',:class=>'Ext::Panel',:extend=>'Ext::Container',:ext=>'Ext.Panel'},
            {:xtype=>'progress',:class=>'Ext::ProgressBar',:extend=>'Ext::BoxComponent',:ext=>'Ext.ProgressBar'},
            {:xtype=>'propertygrid',:class=>'Ext::Grid::PropertyGrid',:extend=>'Ext::Grid::EditorGridPanel',:ext=>'Ext.grid.PropertyGrid'},
            {:xtype=>'slider',:class=>'Ext::Slider::SingleSlider',:extend=>'Ext::Slider::MultiSlider',:ext=>'Ext.slider.SingleSlider'},
            {:xtype=>'spacer',:class=>'Ext::Spacer',:extend=>'Ext::BoxComponent',:ext=>'Ext.Spacer'},
            {:xtype=>'splitbutton',:class=>'Ext::SplitButton',:extend=>'Ext::Button',:ext=>'Ext.SplitButton'},
            {:xtype=>'tabpanel',:class=>'Ext::TabPanel',:extend=>'Ext::Panel',:ext=>'Ext.TabPanel'},
            {:xtype=>'treepanel',:class=>'Ext::Tree::TreePanel',:extend=>'Ext::Panel',:ext=>'Ext.tree.TreePanel'},
            {:xtype=>'viewport',:class=>'Ext::Viewport',:extend=>'Ext::Container',:ext=>'Ext.Viewport'},
            {:xtype=>'window',:class=>'Ext::Window',:extend=>'Ext::Panel',:ext=>'Ext.Window'},
            #Toolbar components 
            {:xtype=>'paging',:class=>'Ext::PagingToolbar',:extend=>'Ext::Toolbar::Toolbar',:ext=>'Ext.PagingToolbar'},
            {:xtype=>'toolbar',:class=>'Ext::Toolbar::Toolbar',:extend=>'Ext::Container',:ext=>'Ext.Toolbar'},
            {:xtype=>'tbfill',:class=>'Ext::Toolbar::Fill',:extend=>'Ext::Toolbar::Spacer',:ext=>'Ext.Toolbar.Fill'},
            {:xtype=>'tbitem',:class=>'Ext::Toolbar::Item',:extend=>'Ext::BoxComponent',:ext=>'Ext.Toolbar.Item'},
            {:xtype=>'tbseparator',:class=>'Ext::Toolbar::Separator',:extend=>'Ext::Toolbar::Item',:ext=>'Ext.Toolbar.Item'},
            {:xtype=>'tbspacer',:class=>'Ext::Toolbar::Spacer',:extend=>'Ext::Toolbar::Item',:ext=>'Ext.Toolbar.Spacer'},
            {:xtype=>'tbtext',:class=>'Ext::Toolbar::TextItem',:extend=>'Ext::Toolbar::Item',:ext=>'Ext.Toolbar.TextItem'},

            #Menu components
            {:xtype=>'menu',:class=>'Ext::Menu::Menu',:extend=>'Ext::Container',:ext=>'Ext.menu.Menu'},
            {:xtype=>'colormenu',:class=>'Ext::Menu::ColorMenu',:extend=>'Ext::Menu::Menu',:ext=>'Ext.menu.ColorMenu'},
            {:xtype=>'datemenu',:class=>'Ext::Menu::DateMenu',:extend=>'Ext::Menu::Menu',:ext=>'Ext.menu.DateMenu'},
            {:xtype=>'menubaseitem',:class=>'Ext::Menu::BaseItem',:extend=>'Ext::Component',:ext=>'Ext.menu.BaseItem'},
            {:xtype=>'menucheckitem',:class=>'Ext::Menu::CheckItem',:extend=>'Ext::Menu::Item',:ext=>'Ext.menu.CheckItem'},
            {:xtype=>'menuitem',:class=>'Ext::Menu::Item',:extend=>'Ext::Menu::BaseItem',:ext=>'Ext.menu.Item'},
            {:xtype=>'menuseparator',:class=>'Ext::Menu::Separator',:extend=>'Ext::Menu::BaseItem',:ext=>'Ext.menu.Separator'},
            {:xtype=>'menutextitem',:class=>'Ext::Menu::TextItem',:extend=>'Ext::Menu::BaseItem',:ext=>'Ext.menu.TextItem'},

            #Form components
            {:xtype=>'form',:class=>'Ext::Form::FormPanel',:extend=>'Ext::Panel',:ext=>'Ext.form.FormPanel'},
            {:xtype=>'checkbox',:class=>'Ext::Form::Checkbox',:extend=>'Ext::Form::Field',:ext=>'Ext.form.CheckBox'},
            {:xtype=>'checkboxgroup',:class=>'Ext::Form::CheckboxGroup',:extend=>'Ext::Form::Field',:ext=>'Ext.form.CheckboxGroup'},
            {:xtype=>'combo',:class=>'Ext::Form::ComboBox',:extend=>'Ext::Form::TriggerField',:ext=>'Ext.form.ComboBox'},
            {:xtype=>'compositefield',:class=>'Ext::Form::CompositeField',:extend=>'Ext::BoxComponent',:ext=>'Ext.form.CompositeField'},
            {:xtype=>'datefield',:class=>'Ext::Form::DateField',:extend=>'Ext::Form::TriggerField',:ext=>'Ext.form.DateField'},
            {:xtype=>'displayfield',:class=>'Ext::Form::DisplayField',:extend=>'Ext::Form::Field',:ext=>'Ext.form.DisplayField'},
            {:xtype=>'field',:class=>'Ext::Form::Field',:extend=>'Ext::BoxComponent',:ext=>'Ext.form.Field'},
            {:xtype=>'fieldset',:class=>'Ext::Form::FieldSet',:extend=>'Ext::Panel',:ext=>'Ext.form.FieldSet'},
            {:xtype=>'hidden',:class=>'Ext::Form::Hidden',:extend=>'Ext::Form::Field',:ext=>'Ext.form.Hidden'},
            {:xtype=>'htmleditor',:class=>'Ext::Form::HtmlEditor',:extend=>'Ext::Form::Field',:ext=>'Ext.Form.HtmlEditor'},
            {:xtype=>'label',:class=>'Ext::Form::Label',:extend=>'Ext::BoxComponent',:ext=>'Ext.form.Label'},
            {:xtype=>'numberfield',:class=>'Ext::Form::NumberField',:extend=>'Ext::Form::TextField',:ext=>'Ext.form.NumberField'},
            {:xtype=>'radio',:class=>'Ext::Form::Radio',:extend=>'Ext::Form::Checkbox',:ext=>'Ext.form.Radio'},
            {:xtype=>'radiogroup',:class=>'Ext::Form::RadioGroup',:extend=>'Ext::Form::CheckboxGroup',:ext=>'Ext.form.RadioGroup'},
            {:xtype=>'textarea',:class=>'Ext::Form::TextArea',:extend=>'Ext::Form::TextField',:ext=>'Ext.form.TextArea'},
            {:xtype=>'textfield',:class=>'Ext::Form::TextField',:extend=>'Ext::Form::Field',:ext=>'Ext.form.TextField'},
            {:xtype=>'timefield',:class=>'Ext::Form::TimeField',:extend=>'Ext::Form::ComboBox',:ext=>'Ext.form.TimeField'},
            {:xtype=>'trigger',:class=>'Ext::Form::TriggerField',:extend=>'Ext::Form::TextField',:ext=>'Ext.form.TriggerField'},
       
            #Chart components
            {:xytpe=>'chart',:class=>'Ext::Chart::Chart',:extend=>'Ext::FlashComponent',:ext=>'Ext.char.Char'},
            {:xtype=>'barchart',:class=>'Ext::Chart::BarChart',:extend=>'Ext::Chart::CartesianChart',:ext=>'Ext.char.BarChar'},
            {:xtype=>'cartesianchart',:class=>'Ext::Chart::CartesianChart',:extend=>'Ext::Chart::Chart',:ext=>'Ext.char.CartesianChar'},
            {:xtype=>'columnchart',:class=>'Ext::Chart::ColumnChart',:extend=>'Ext::Chart::CartesianChart',:ext=>'Ext.char.ColumnChar'},
            {:xtype=>'linechart',:class=>'Ext::Chart::LineChart',:extend=>'Ext::Chart::CartesianChart',:ext=>'Ext.char.PieChar'},
            {:xtype=>'piechart',:class=>'Ext::Chart::PieChart',:extend=>'Ext::Chart::Chart',:ext=>'Ext.char.PieChar'},

            #Store xtypes
            {:xtype=>'arraystore',:class=>'Ext::Data::ArrayStore',:extend=>'Ext::Data::Store',:ext=>'Ext.data.ArrayStore'},
            {:xtype=>'directstore',:class=>'Ext::Data::DirectStore',:extend=>'Ext::Data::Store',:ext=>'Ext.data.DirectStore'},
            {:xtype=>'groupingstore',:class=>'Ext::Data::GroupingStore',:extend=>'Ext::Data::Store',:ext=>'Ext.data.GroupingStore'},
            {:xtype=>'jsonstore',:class=>'Ext::Data::JsonStore',:extend=>'Ext::Data::Store',:ext=>'Ext.data.JsonStore'},
            {:xtype=>'store',:class=>'Ext::Data::Store',:extend=>'Ext::Util::Observable',:ext=>'Ext.data.Store'},
            {:xtype=>'xmlstore',:class=>'Ext::Data::XmlStore',:extend=>'Ext::Data::Store',:ext=>'Ext.data.XmlStore'},
           
            #Grid Column 
            {:class=>'Ext::Grid::Column',:extend=>'Ext::Object',:ext=>'Ext.grid.Column'},
            {:class=>'Ext::Grid::ActionColumn',:extend=>'Ext::Grid::Column',:ext=>'Ext.grid.ActionColumn'},
            {:class=>'Ext::Grid::BooleanColumn',:extend=>'Ext::Grid::Column',:ext=>'Ext.grid.BooleanColumn'},
            {:class=>'Ext::Grid::DateColumn',:extend=>'Ext::Grid::Column',:ext=>'Ext.grid.DateColumn'},
            {:class=>'Ext::Grid::NumberColumn',:extend=>'Ext::Grid::Column',:ext=>'Ext.grid.NumberColumn'},
            {:class=>'Ext::Grid::TemplateColumn',:extend=>'Ext::Grid::Column',:ext=>'Ext.grid.TemplateColumn'},
            {:class=>'Ext::Grid::CheckboxColumn',:extend=>'Ext::Grid::Column',:ext=>'Ext.grid.CheckboxSelectionModel'},
            
            #Grid ColumnModel
            {:class=>'Ext::Grid::ColumnModel',:extend=>'Ext::Util::Observable',:ext=>'Ext.grid.ColumnModel'},
            {:class=>'Ext::Grid::PropertyColumnModel',:extend=>'Ext::Grid::ColumnModel',:ext=>'Ext.grid.PropertyColumnModel'},
            
            #Data Field
            {:class=>'Ext::Data::Field',:extend=>'Ext::Object',:ext=>'Ext.data.Field'},
            
            #Layout
            {:class=>'Ext::Layout::ContainerLayout',:extend=>'Ext::Object',:ext=>'Ext.layout.ContainerLayout'},
            {:class=>'Ext::Layout::AnchorLayout',:extend=>'Ext::Layout::ContainerLayout',:ext=>'Ext.layout.AnchorLayout'},
            {:class=>'Ext::Layout::BorderLayout',:extend=>'Ext::Layout::ContainerLayout',:ext=>'Ext.layout.BorderLayout'},
            {:class=>'Ext::Layout::BoxLayout',:extend=>'Ext::Layout::ContainerLayout',:ext=>'Ext.layout.BoxLayout'},
            {:class=>'Ext::Layout::ColumnLayout',:extend=>'Ext::Layout::ContainerLayout',:ext=>'Ext.layout.ColumnLayout'},
            {:class=>'Ext::Layout::FitLayout',:extend=>'Ext::Layout::ContainerLayout',:ext=>'Ext.layout.FitLayout'},
            {:class=>'Ext::Layout::MenuLayout',:extend=>'Ext::Layout::ContainerLayout',:ext=>'Ext.layout.MenuLayout'},
            {:class=>'Ext::Layout::TableLayout',:extend=>'Ext::Layout::ContainerLayout',:ext=>'Ext.layout.TableLayout'},
            {:class=>'Ext::Layout::HBoxLayout',:extend=>'Ext::Layout::BoxLayout',:ext=>'Ext.layout.HBoxLayout'},
            {:class=>'Ext::Layout::VBoxLayout',:extend=>'Ext::Layout::BoxLayout',:ext=>'Ext.layout.VBoxLayout'},
            {:class=>'Ext::Layout::FormLayout',:extend=>'Ext::Layout::AnchorLayout',:ext=>'Ext.layout.FormLayout'},

            #Proxy
            {:class=>'Ext::Data::DataProxy',:extend=>'Ext::Util::Observable',:ext=>'Ext.data.DataProxy'},
            {:class=>'Ext::Data::DirectProxy',:extend=>'Ext::Data::DataProxy',:ext=>'Ext.data.DirectProxy'},
            {:class=>'Ext::Data::HttpProxy',:extend=>'Ext::Data::DataProxy',:ext=>'Ext.data.HttpProxy'},
            {:class=>'Ext::Data::MemoryProxy',:extend=>'Ext::Data::DataProxy',:ext=>'Ext.data.MemoryProxy'},
            {:class=>'Ext::Data::ScriptTagProxy',:extend=>'Ext::Data::DataProxy',:ext=>'Ext.data.ScriptTagProxy'},
            
            #Grid SelectionModel
            {:class=>'Ext::Grid::AbstractSelectionModel',:extend=>'Ext::Util::Observable',:ext=>'Ext.grid.AbstractSelectionModel'},
            {:class=>'Ext::Grid::CellSelectionModel',:extend=>'Ext::Grid::AbstractSelectionModel',:ext=>'Ext.grid.CellSelectionModel'},
            {:class=>'Ext::Grid::RowSelectionModel',:extend=>'Ext::Grid::AbstractSelectionModel',:ext=>'Ext.grid.RowSelectionModel'},
            {:class=>'Ext::Grid::CheckboxSelectionModel',:extend=>'Ext::Grid::RowSelectionModel',:ext=>'Ext.grid.CheckboxSelectionModel'},
            
            #Template
            {:class=>'Ext::Template',:extend=>'Ext::Object',:ext=>'Ext.Template'},
            {:class=>'Ext::XTemplate',:extend=>'Ext::Template',:ext=>'Ext.XTemplate'},
          

         ]

