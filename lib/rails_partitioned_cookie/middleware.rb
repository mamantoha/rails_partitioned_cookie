module RailsPartitionedCookie
  class Middleware
    COOKIE_SEPARATOR = "\n".freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if headers['Set-Cookie']
        cookies = headers['Set-Cookie'].split(COOKIE_SEPARATOR)

        cookies.map! do |cookie|
          cookie += '; Partitioned' if cookie.include?('SameSite=None')
          cookie
        end

        headers['Set-Cookie'] = cookies.join(COOKIE_SEPARATOR)
      end

      [status, headers, response]
    end
  end
end
