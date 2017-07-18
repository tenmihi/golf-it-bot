require 'uri'
require 'net/https'
require 'json'

require 'nokogiri'
require 'open-uri'

module Workshop
  # Get max index of golf-it workshop item page pager
  def getMaxPagerIndex()
    uri = URI('https://steamcommunity.com/workshop/browse/')
    uri.query = {
      appid:       571740,
      browsesort: 'mostrecent',
      section:    'readytouseitems',
      actualsort: 'trend',
      p:          1,
      numperpage: 30
    }.map{ |k,v| "#{k}=#{v}" }.join("&")

    doc = Nokogiri::HTML(open(uri.to_s))

    # ワークショップアイテム1ページ目のページャコントローラの値から確認する
    nodes = doc.xpath("//div[@class='workshopBrowsePagingControls']/descendant::a[3]")

    return nodes.first.text.to_i
  end

  # Get random map in golf-it workshop and return that infomation
  def getRandomSharedMapUrl(max_page)
    page_idx = rand(1..max_page)
    item_idx = rand(0..29)

    uri = URI('https://steamcommunity.com/workshop/browse/')
    uri.query = {
      appid:      571740,
      browsesort: 'mostrecent',
      section:    'readytouseitems',
      actualsort: 'trend',
      p:          page_idx,
      numperpage: 30
    }.map{ |k,v| "#{k}=#{v}" }.join("&")

    doc = Nokogiri::HTML(open(uri.to_s))

    nodes = doc.xpath("//div[@class='workshopBrowseRow']//div[@class='workshopItem left' or @class='workshopItem right' or @class='workshopItem middle']")
    max_idx = nodes.count - 1
    rnd_node = nodes[rand(0..max_idx)]

    author = rnd_node.xpath(".//div[@class='workshopItemAuthorName']/a").first

    return {
      title:       rnd_node.xpath(".//div[@class='workshopItemTitle ellipsis']").first.text ,
      thumbnail:   rnd_node.xpath(".//img[@class='workshopItemPreviewImage ']").first.attribute('src').value,
      url:         rnd_node.xpath(".//a[1]").first.attribute('href').value,
      author_name: author.text,
      author_url:  author.attribute('href').value
    }
  end

  module_function :getMaxPagerIndex, :getRandomSharedMapUrl
end
