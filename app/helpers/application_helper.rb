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
    opts = {
        :coderay_wrap => :div,
        :enable_coderay => true,
        :coderay_line_numbers => nil
    }
    Kramdown::Document.new(text, opts).to_html.html_safe
  end

  def page_title
    title = ""
    if @page_title.present?
      title = @page_title + " | "
    end
    title += "Lesleh.co.uk"
  end

end
