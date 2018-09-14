require 'slack-ruby-client'
# require 'async-websocket'
load '.env'

Slack.configure do |config|
  config.token = SLACK_TOKEN
end
client = Slack::Web::Client.new


conversations = client.conversations_list({types:'im'})
# users = client.users_info({user:"U8SEPQRFY"})
# p users
# channels = client.channels_list({types:'im'}).channels
p conversations
# client.chat_postMessage(channel: XXXXXXXXXXXX, text: 'hi zoe', as_user: true)
