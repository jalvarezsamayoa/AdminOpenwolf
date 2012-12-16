module ApplicationHelper

  def default_body_attributes(base_class = '')
    controller_name = controller.controller_path.gsub(/\//, '-')
    action_name     = controller.action_name
    value = { :id =>    "#{controller_name}-#{action_name}",
              :class => "#{controller_name} #{base_class}" }
    return value
  end

  def menu_item(text, url, title='', image = 'icon-th-list', active = false)
    image ||= 'icon-th-list'
    content_tag(:li, nil, :class => (active ? 'active' : nil)) do
      link_to(url, :title => title) do
        concat content_tag(:i, nil, :class => image)
        concat content_tag(:span, text, :class => 'hidden-tablet' )
      end
    end
  end

  def si_no(valor)
    valor ? 'Si' : 'No'
  end

  def current_page?(value = nil)
    return false if value.nil?
    controller_name = controller.controller_path.gsub(/\//, '-')
    (controller_name == value)
  end

end
