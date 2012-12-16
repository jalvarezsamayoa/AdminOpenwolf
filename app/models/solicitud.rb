# -*- coding: utf-8 -*-
class Solicitud < ActiveRecord::Base  

  belongs_to :institucion
  belongs_to :usuario
  belongs_to :municipio
  belongs_to :departamento
  belongs_to :via
  belongs_to :estado
  belongs_to :profesion
  belongs_to :genero
  belongs_to :rangoedad
  belongs_to :clasificacion
  belongs_to :motivonegativa
  belongs_to :motivoprorroga
  belongs_to :documentoclasificacion
  belongs_to :idioma

  has_many :actividades, :dependent => :destroy
  has_many :seguimientos, :through => :actividades

  has_many :adjuntos, :as => :proceso, :dependent => :destroy
  has_many :notas, :as => :proceso, :dependent => :destroy
  has_many :resoluciones, :dependent => :destroy
  has_many :recursosrevision, :dependent => :destroy

  has_many :enlaces, :through => :actividades, :uniq => true, :source => :usuario
  
  ########################
  # Filtros
  ########################
  default_scope :include => [:usuario, :institucion, :via, :estado]

  scope :activas, where("solicitudes.anulada = ?", false)
  scope :anuladas, where("solicitudes.anulada = ?", true)

  #  scope :asignadas, :conditions=>["solicitudes.asignada = ?", true ]
  scope :asignadas, where("solicitudes.asignada = ?", true )
  scope :noasignadas, where("solicitudes.asignada = ?", false)

  scope :completadas, where("solicitudes.fecha_completada is not null")
  scope :nocompletadas, where("solicitudes.fecha_completada is null")

  scope :sinresolucion, where("solicitudes.fecha_resolucion is null")
  scope :conresolucion, where("solicitudes.fecha_resolucion is not null")

  scope :sinresolucionfinal, where("(solicitudes.fecha_resolucion is null) or (solicitudes.fecha_resolucion is not null and estados.final = ?)",false )
  scope :conresolucionfinal, where("(solicitudes.fecha_resolucion is not null) and (estados.final = ?)", true )


  scope :entregadas, where("solicitudes.fecha_entregada is not null")
  scope :noentregadas, where("solicitudes.fecha_entregada is null")

  scope :recientes, :order => "fecha_creacion desc"
  scope :correlativo, :order => "ano desc, numero desc"

  scope :creadas_en_ano, lambda {|ano| where( "date_part(\'year\',fecha_creacion) = ?",ano) }

  scope :tiempoejecucion, lambda { |tiempo_desde, tiempo_hasta| {
      :conditions => ["(((fecha_programada - ?)*100)/10) between ? and ?",Date.today, tiempo_desde, tiempo_hasta]
  }}

  scope :tiempo_transcurrido, lambda { |tiempo_desde, tiempo_hasta| {
      :conditions => ["(current_date - fecha_creacion) between ? and ?",tiempo_desde, tiempo_hasta]
  }}

  scope :tiempo_restante, lambda { |tiempo_desde, tiempo_hasta| {
      :conditions => ["(fecha_programada - current_date) between ? and ?",tiempo_desde, tiempo_hasta]
  }}

  scope :ingresadas, lambda { |desde, hasta| {
      :conditions => ["solicitudes.fecha_creacion between ? and ?",desde, hasta]
  }}



end

# == Schema Information
#
# Table name: solicitudes
#
#  id                          :integer          not null, primary key
#  usuario_id                  :integer          not null
#  codigo                      :string(255)      default("XXXXX-999999-9999"), not null
#  institucion_id              :integer          not null
#  tiposolicitud_id            :integer          default(1)
#  via_id                      :integer          default(1), not null
#  fecha_creacion              :date
#  fecha_programada            :date
#  fecha_entregada             :date
#  fecha_resolucion            :date
#  fecha_prorroga              :date
#  fecha_completada            :date
#  solicitante_nombre          :string(255)      not null
#  solicitante_identificacion  :string(255)
#  solicitante_direccion       :string(255)
#  solicitante_telefonos       :string(255)
#  solicitante_institucion     :string(255)
#  departamento_id             :integer
#  municipio_id                :integer
#  email                       :string(255)
#  forma_entrega               :string(255)
#  observaciones               :text
#  ubicacion_url               :string(255)
#  estado_id                   :integer          default(1)
#  created_at                  :datetime
#  updated_at                  :datetime
#  textosolicitud              :text
#  asignada                    :boolean
#  ano                         :integer          not null
#  numero                      :integer          not null
#  profesion_id                :integer
#  genero_id                   :integer
#  rangoedad_id                :integer
#  clasificacion_id            :integer
#  dias_respuesta              :integer
#  dias_prorroga               :integer
#  motivonegativa_id           :integer
#  motivoprorroga_id           :integer
#  informacion_publica         :boolean          default(TRUE), not null
#  origen_id                   :integer          default(1)
#  documentoclasificacion_id   :integer          default(1)
#  idioma_id                   :integer          default(12), not null
#  anulada                     :boolean          default(FALSE)
#  tiempo_respuesta            :integer          default(0)
#  tiempo_respuesta_calendario :integer          default(0)
#  reserva_temporal            :boolean          default(FALSE)
#

