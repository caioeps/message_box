module ToastHelper
  def show_flash_messages
    flash.map do |type, value|
      content_tag :span, value, style: 'display:none', class: 'flash-message'
    end.join.html_safe
  end
end
