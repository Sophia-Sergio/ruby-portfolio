module ApplicationHelper
  def login_helper(style_class = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style_class) +
        ' ' + (link_to 'Login', new_user_session_path, class: style_class)

    else
      link_to 'Log Out', destroy_user_session_path, class: style_class, method: :delete
    end
  end

  def source_helper
    greeting = "Gracias por visitarme desde #{session[:source]}"
    content_tag(:p, greeting) if session[:source]
  end

  def nav_items
    [
      { url: root_path, title: 'Home' },
      { url: about_me_path, title: 'About Me' },
      { url: contact_path, title: 'Contact' },
      { url: blogs_path, title: 'Blog' },
      { url: portfolios_path, title: 'Portfolio' }
    ]
  end

  def nav_helper(tag_type, tag_style)
    nav_links = ''
    nav_items.each do |i|
      nav_links << "<#{tag_type}>
                      <a href='#{i[:url]}' class='#{tag_style} #{active?(i[:url])}'>
                        #{i[:title]}
                      </a>
                    </#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page?(path)
  end
end
