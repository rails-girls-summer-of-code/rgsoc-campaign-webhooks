require_relative './spec_helper'
require_relative '../app.rb'

describe CampaignNotifier do

  describe 'unauthenticated requests' do

    it "responds with 403 when no token is given" do
      post '/'

      last_response.status.should be(403)
    end

    it "responds with 403 when an invalid token is given" do
      post '/', auth_token: "Sowiesonotvalid"

      last_response.status.should be(403)
    end

  end

  it "responds with 200 when a valid token is given" do
    post '/', auth_token: CampaignNotifier.settings.auth_tokens.values.first

    last_response.status.should be(200)
  end

end
