class DepartamentosController < InheritedResources::Base
  before_filter :authenticate_usuario!

  add_crumb("Departamentos") { |instance| instance.send :departamentos_path }


  protected

  def collection
    @q = Departamento.search(params[:q])
    @departamentos ||= @q.result.page(params[:page])
  end

end
