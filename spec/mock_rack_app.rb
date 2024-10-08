class MockRackAppWithSameSiteCookie
  attr_reader :request_headers

  def initialize
    @request_headers = {}
  end

  def call(env)
    @env = env
    @set_cookie_header = env['HTTP_SET_COOKIE']
    [200, { 'Content-Type' => 'text/plain', 'Set-Cookie' => "SameSite=None; " }, ['OK']]
  end

  def [](key)
    @env[key]
  end
end

class MockRackAppWithoutSameSiteCookie
  attr_reader :request_headers

  def initialize
    @request_headers = {}
  end

  def call(env)
    @env = env
    @set_cookie_header = env['HTTP_SET_COOKIE']
    [200, { 'Content-Type' => 'text/plain', 'Set-Cookie' => "SameSite=Lax; " }, ['OK']]
  end

  def [](key)
    @env[key]
  end
end
