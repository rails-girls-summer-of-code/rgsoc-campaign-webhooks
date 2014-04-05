require_relative './spec_helper.rb'
require_relative '../app.rb'

describe CampaignNotifier do

  it "responds with ok to /ping" do
    get '/ping'

    last_response.should be_ok
  end

end
