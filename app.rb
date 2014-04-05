require "sinatra/base"
require "sinatra/config_file"
require_relative 'lib/notifier'

class CampaignNotifier < Sinatra::Base
  register Sinatra::ConfigFile

  config_file 'config/app.yml'

  Notifier.require_and_register_notifiers

  post '/' do
    authenticate!
    'ok'
  end

  protected

  def authenticate!
    unless params[:auth_token] && settings.auth_tokens.values.include?(params[:auth_token])
      status 403
    end
  end

end
