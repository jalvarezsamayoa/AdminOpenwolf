source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Servidor
gem 'thin'

# AUTENTICACION
gem 'devise' # libreria de autenticacion
gem 'cancan' #libreria manejo de accesos a recursos
gem 'rolify' #genera control de roles


# Active Record
gem 'awesome_nested_set'

# HELPERS
gem 'haml' # sistema para generacion de templates
gem 'haml-rails'


# Controllers
gem 'inherited_resources' #encapsula operaciones basicas para controladores


# VIEWS
gem "simple_form"
gem 'kaminari' # pagineo de resultados
gem 'jquery-rails' #jquery para rails, remplaza prototype y scriptaculous
gem 'paperclip' # modulo para hacer upload a archivos
gem "crummy", "~> 1.6.0" # manejo de breadcrumbs


# Twitter Bootstrap
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails',  :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'libv8', '~> 3.11.8'


# MONITOREO
#gem 'airbrake' #notificacion de errores via http://hoptoadapp.com/

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'


end


group :development, :test do
  gem 'faker' # herramienta para generacion de datos de prueba
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'

  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'

  gem 'quiet_assets'
end


# TESTING
group  :test do

  gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"


  gem "capybara"
  gem "factory_girl_rails", "~> 4.0"
  gem "launchy"

  gem 'rb-inotify'
  gem 'libnotify'
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
