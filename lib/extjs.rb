# Extjs
#

EXT_DEBUG = (not RAILS_ENV == 'production')

require 'erb'
require 'pathname'

EXT_LIB_PATH = Pathname.new(File.dirname(__FILE__)).realpath.to_s + '/'


require 'Ext/json'
require 'Ext/i18n'
require 'Ext/object'
require 'Ext/ext_cls'
require 'Ext/eval_cls'
require 'Ext/global'
require 'Ext/util'
require 'Ext/javascript'
require 'Ext/send'
require 'Ext/ajax'
require 'Ext/msg'
require 'Ext/wait'
require 'Ext/record_form'

require 'Ext/init'
require 'Ext/find'

Ext::Init.load_locales
Ext::Init.define_exts
Ext::Init.load_uis
Ext::Init.include_helper


