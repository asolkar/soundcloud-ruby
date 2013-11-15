require 'helper'

RSpec.configure do |config|
  WebMock.allow_net_connect!
end

describe SoundCloud do
  context 'initialized with access_token' do
    subject {
      SoundCloud.new(:access_token => ENV['ACCESS_TOKEN'],
                     :client_id => ENV['CLIENT_ID'],
                     :client_secret => ENV['CLIENT_SECRET'])}

    describe "#get /me" do
      it "returns authenticated user details" do
        resp = subject.send(:get, '/me')
        # pp resp.inspect
        expect(resp.kind).to eq('user')
      end
    end
    describe "#get /me/followings" do
      it "returns authenticated user followings" do
        resp = subject.send(:get, '/me/followings')
        # pp resp.inspect
        expect(resp).to be_an Array
        expect(resp[0].kind).to eq('user')
      end
    end
    #
    # If you use an id that I don't follow, expect a response error.
    # 37626 is a random user ID. If you happen to follow it, use some
    # other id
    #
    describe "#get /me/followings/37626" do
      it "returns not found" do
        # pp resp.inspect
        expect do
          subject.send(:get, "/me/followings/37626")
        end.to raise_error(SoundCloud::ResponseError)
      end
    end
    #
    # If you use an id that I do follow, expect an OK response with user object
    #
    describe "#get /me/followings/#{ENV['TEST_ID']}" do
      it "returns authenticated user following for id #{ENV['TEST_ID']}" do
        resp = subject.send(:get, "/me/followings/#{ENV['TEST_ID']}")
        # pp resp.inspect
        expect(resp.kind).to eq('user')
      end
    end
  end
end
