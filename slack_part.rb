require 'slack-ruby-client'
# require 'async-websocket'
Slack.configure do |config|
  config.token = "xoxb-305815039251-GoexUD6TAM02tfgpVZ6enDEG"
end
client = Slack::Web::Client.new


# conversations = client.conversations_list({types:'im'})
# users = client.users_info({user:"U8SEPQRFY"})
# p users
# channels = client.channels_list({types:'im'}).channels
# p conversations
# client.chat_postMessage(channel: XXXXXXXXXXXX, text: 'hi zoe', as_user: true)
