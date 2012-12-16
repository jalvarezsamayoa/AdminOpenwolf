#openwolf.rb

module OpenWolf
  def logger
    Rails.logger if defined?(Rails)
  end
end

require_relative "referential_integrity"