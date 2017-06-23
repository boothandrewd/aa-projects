module ApplicationHelper
  def auth_token
    <<-HTML
      <input
        type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}"
        >
    HTML
      .html_safe
  end

  def hidden_form_action(method)
    "<input type='hidden' name='_method' value='#{method}'>".html_safe
  end
end
