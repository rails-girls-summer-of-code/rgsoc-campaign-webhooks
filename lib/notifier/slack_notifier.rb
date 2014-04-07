require 'json'

class SlackNotifier < Notifier
  attr_reader :account, :token, :channel

  def initialize(registry)
    super(registry)
    @account = settings.notifier['slack']["account"]
    @token   = settings.notifier['slack']["token"]
    @channel = settings.notifier['slack']["channel"]
  end

  def hook_url
    @hook_url ||= "https://#{account}.slack.com/services/hooks/incoming-webhook?token=#{token}"
  end

  def uri
    @uri ||= URI.parse(hook_url)
  end

  def connection
    http             = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl     = true

    http
  end

  def post(data)
    request      = Net::HTTP::Post.new(uri.request_uri)
    request.body = "payload=#{data.to_json}"
    connection.request(request)
  end

  def process(msg)
    data = {
      channel: channel,
      text:    msg
    }
    post(data)
  end

end
