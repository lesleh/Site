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

  def random_pun
    pun = Pun.random
    pun.present? ? pun.text : ''
  end

  def markdown(text)
    Kramdown::Document.new(text).to_html.html_safe
  end

end
