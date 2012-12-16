#encoding: utf-8
module ButtonsHelper

  def button(text = 'Grabar', icon = 'icon-ok')
    c_return = '<button type="submit" class="btn">'
    c_return += "<i class='#{icon} icon-white'></i> #{text}"
    c_return += '</button>'
    raw(c_return)
  end

  def button_create(text = 'Grabar Nuevo')
    return button(text)
  end

  def button_update(text = 'Grabar Cambios')
    return button(text)
  end


  def button_link(url = "#", text = 'Click Me', title = 'Click me', icon = 'icon-ok', positive = true, delete = false  )
    c_icon = image_tag(icon)

    unless delete
      if positive == true
        c_return = link_to(url, :class => 'btn', :title => title) do
          raw "<i class='#{icon} icon-white'></i> #{text}"
        end
      else
        c_return = link_to(url, :class => 'btn btn-danger', :title => title) do
          raw "<i class='#{icon} icon-white'></i> #{text}"
        end
      end
    else
      c_return = link_to(url, :class => 'btn btn-danger', :title => title, :method => :delete, :confirm => '¿Está seguro de eliminar el registro?') do
        raw "<i class='#{icon} icon-white'></i> #{text}"
      end
    end

    return c_return
  end

  def button_new(url = "#", text = 'Nuevo')
    return button_link(url, text, "Crea nuevo registro.", 'icon-plus')
  end

  def button_edit(url = "#", text = 'Editar')
    return button_link(url, text, "Editar información.", 'icon-pencil')
  end

  def button_delete(url = "#", text = 'Eliminar')
    return button_link(url, text, "Eliminar el registro.", 'icon-trash', false, true)
  end

  def button_cancel(url = "#", text = 'Cancelar')
    return button_link(url, text, "Cancelar operación.", 'icon-remove')
  end


  def button_print(url = "#", text = 'Imprimir')
    c_return = link_to(url, :class => 'btn', :title => 'Imprime Documento', :popup => true) do
      raw "<i class='icon-print icon-white'></i> #{text}"
    end
    return raw(c_return)
  end

  def button_export(url = "#", text = 'Exportar')
    c_return = link_to(url, :class => 'btn', :title => 'Exportar Documento a Plantilla', :popup => true) do
      raw "<i class='icon-download icon-white'></i> #{text}"
    end
    return raw(c_return)
  end


  def buttons_create(url = "#")
    return button_create + button_cancel(url)
  end

  def buttons_update(url = "#")
    return button_update + button_cancel(url)
  end

  def buttons_toolbar(item)
    instance_name = item.class.name.tableize.singularize
    instance_plural_name = item.class.name.tableize
    instance_path = instance_name + "_path(item)"
    index_path = instance_plural_name + "_path"

    buttons = button_new( eval("new_" + instance_name + "_path" ) )
    buttons += button_edit( eval("edit_" + instance_path) )
    buttons += button_delete( eval( instance_path ) )
    buttons += button_cancel( eval( index_path ) )
    buttons
  end
end
