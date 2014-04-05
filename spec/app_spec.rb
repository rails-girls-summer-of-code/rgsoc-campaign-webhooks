require File.expand_path '../spec_helper.rb', __FILE__

describe CampaignNotifier do

  it "responds with ok to /ping" do
    get '/ping'

    last_response.should be_ok
  end

end
