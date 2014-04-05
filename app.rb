require "sinatra/base"
require "sinatra/config_file"
require_relative 'lib/notifier'

class CampaignNotifier < Sinatra::Base
  register Sinatra::ConfigFile

  config_file 'config/app.yml'

  get '/ping' do
    'ok'
  end

end
