class MunicipiosController < InheritedResources::Base
  respond_to :html
  before_filter :authenticate_usuario!
  add_crumb("Municipios") { |instance| instance.send :municipios_path }

  protected

  def collection
    @q = Municipio.search(params[:q])
    @municipios ||= @q.result.page(params[:page])
  end

end
