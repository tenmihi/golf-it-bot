require 'uri'
require 'net/https'
require 'json'

module SteamNews

  def getLatest()
    uri = URI.parse('https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/')
    uri.query = {
      appid: 571740,
      count: 1
    }.map{ |k,v| "#{k}=#{v}" }.join("&")

    res = Net::HTTP.get(uri)
    data = JSON.parse(res)

    return data["appnews"]
  end

  module_function :getLatest
end

SteamNews.getLatest()
