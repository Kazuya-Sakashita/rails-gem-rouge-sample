module ApplicationHelper
  require "redcarpet"
  require "rouge"
  require "rouge/plugins/redcarpet"
  require 'nokogiri'

  class HTMLwithRouge < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet

    def block_code(code, language)
      # 略
    end
  end

  def markdown_to_html_with_blank_target(text)
    renderer = CustomRedcarpetRenderer.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    markdown = Redcarpet::Markdown.new(renderer, options)
    rendered_html = markdown.render(text)

    # target="_blank" をリンクに追加
    doc = Nokogiri::HTML.fragment(rendered_html)
    doc.css('a').each do |link|
      link['target'] = '_blank'
    end

    doc.to_html.html_safe
  end

end
