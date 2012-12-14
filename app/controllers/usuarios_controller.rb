class UsuariosController <  InheritedResources::Base
  before_filter :authenticate_usuario!

  add_crumb("Usuarios") { |instance| instance.send :usuarios_path }

  protected
  def collection
    @usuarios ||= end_of_association_chain.page(params[:page])
  end
end
