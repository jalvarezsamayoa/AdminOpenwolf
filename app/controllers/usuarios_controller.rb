class UsuariosController <  InheritedResources::Base
  before_filter :authenticate_usuario!

  add_crumb("Usuarios") { |instance| instance.send :usuarios_path }

  def update
    if params[:usuario][:password].nil? or params[:usuario][:password].empty?
      params[:usuario].delete(:password)
      params[:usuario].delete(:password_confirmation)
    end
    update!
  end

  protected
  def collection
  	@q = Usuario.includes(:institucion).search(params[:q])
    @usuarios ||= @q.result.page(params[:page])
  end
end
