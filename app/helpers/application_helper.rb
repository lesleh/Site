require 'rouge/plugins/redcarpet'

module ApplicationHelper

  def bootstrap_class_for flash_type
    {
        success: "alert-success",
        error: "alert-danger",
        alert: "alert-warning",
        notice: "alert-info"
    }[flash_type.to_sym] || 'alert-' + flash_type.to_s
  end

  def logged_in?
    true if session[:login]
  end

  class RougeHTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet # yep, that's it.
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(RougeHTML, fenced_code_blocks: true)
    markdown.render(text).html_safe
  end

end
