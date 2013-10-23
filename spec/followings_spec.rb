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
    describe "#get /me/followings/#{ENV['TEST_ID']}" do
      it "returns authenticated user following for id #{ENV['TEST_ID']}" do
        resp = subject.send(:get, "/me/followings/#{ENV['TEST_ID']}")
        # pp resp.inspect
        expect(resp.kind).to eq('user')
      end
    end
  end
end
