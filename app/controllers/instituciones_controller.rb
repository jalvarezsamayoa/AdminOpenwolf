class InstitucionesController < InheritedResources::Base
  before_filter :authenticate_usuario!
  before_filter :get_data

  add_crumb("Instituciones") { |instance| instance.send :instituciones_path }

  def get_data
    @padres = Institucion.padres
  end

  protected

  def collection
    @q = Institucion.search(params[:q])
    @instituciones ||= @q.result.page(params[:page])
  end
end
