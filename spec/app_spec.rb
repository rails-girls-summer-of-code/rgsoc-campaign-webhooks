require_relative './spec_helper'
require_relative '../app.rb'

describe CampaignNotifier do

  it "responds with ok to /ping" do
    get '/ping'

    last_response.should be_ok
  end

end
