# forms_helper.rb
module FormsHelper

  def form_filter(opts = {}, &block)
    search_form_for opts[:q], :class => 'form-search' do |f|
      concat f.text_field :nombre_cont, :placeholder => "Nombre Contiene"
      yield(f) if block_given?
      concat button_tag("Buscar", :class => "btn")
    end
  end

end