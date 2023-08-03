require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class CustomRedcarpetRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
