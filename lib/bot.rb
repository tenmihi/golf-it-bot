require 'discordrb'

require_relative 'workshop'
require_relative 'steamnews'

Process.daemon if ARGV.any? {|i| i == '-D' }

TOKEN     = ENV['DISCORD_GOLF_IT_TOKEN']
CLIENT_ID = ENV['DISCORD_GOLF_IT_CLIENT_ID']

bot = Discordrb::Bot.new token: TOKEN, client_id: CLIENT_ID

bot.message(with_text: 'golf ping') do |event|
  event.respond 'PONG :skull_crossbones:'
end

bot.message(with_text: 'golf map') do |event|
  event.respond 'Please wait...'

  max_idx = Workshop.getMaxPagerIndex()
  map_data = Workshop.getRandomSharedMapUrl(max_idx)

  event.respond 'How do you like this map? :golfer:'

  event.channel.send_embed do |embed|
    embed.title = map_data[:title]
    embed.url = map_data[:url]
    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'by ' + map_data[:author_name], url: map_data[:author_url])
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: map_data[:thumbnail])
  end
end

bot.message(with_text: 'golf news') do |event|
  news = SteamNews.getLatest()

  news_item = news['newsitems'][0]
  description = news_item['contents'].to_s

  if description.length > 100 then
    description = description.slice(0,100) + '...'
  end

  event.channel.send_embed do |embed|
    embed.title = news_item['title']
    embed.url = news_item['url']
    embed.description = description
    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'by ' + news_item['author'])
  end
end

bot.run
