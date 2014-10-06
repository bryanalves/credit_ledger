module ApplicationHelper
  def conditional_html(&block)
    cls = "no-js wf-loading"
    return <<-HTML.gsub(/^\s+/, '').html_safe + capture(&block) + "</html>".html_safe
      <!--[if lt IE 9 ]>              <html lang="en" class="#{cls} lt-ie10 lt-ie9"> <![endif]-->
      <!--[if IE 9 ]>                 <html lang="en" class="#{cls} lt-ie10"> <![endif]-->
      <!--[if (gte IE 9)|!(IE)]><!--> <html lang="en" class="#{cls}"> <!--<![endif]-->
    HTML
  end
end
