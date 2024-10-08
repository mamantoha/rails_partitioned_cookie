# frozen_string_literal: true

require 'rails_partitioned_cookie/middleware'

module RailsPartitionedCookie
  class Railtie < Rails::Railtie # :nodoc:
    initializer 'rails_partitioned_cookie.setup_middleware' do
      Rails.application.middleware.insert_after ::Rack::Runtime, ::RailsPartitionedCookie::Middleware
    end
  end
end
