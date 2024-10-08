RSpec.describe RailsPartitionedCookie::Middleware do
  context "with SameSite=none" do
    let(:app) { MockRackAppWithSameSiteCookie.new }
    subject { described_class.new(app) }

    let(:request) { Rack::MockRequest.new(subject) }

    it "should add Partitioned to cookies for requests" do
      response = request.post("/some/path")
      expect(response['Set-Cookie']).to match(/;\s*Partitioned/i)
    end
  end

  context "without SameSite=none" do
    let(:app) { MockRackAppWithoutSameSiteCookie.new }
    subject { described_class.new(app) }

    let(:request) { Rack::MockRequest.new(subject) }

    it "should not add Partitioned to cookies for requests" do
      response = request.post("/some/path")
      expect(response['Set-Cookie']).to_not match(/;\s*Partitioned/i)
    end
  end
end
