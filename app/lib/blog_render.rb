require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'
# markdown構文向けの独自のレンダリングクラス
class BlogRender < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end