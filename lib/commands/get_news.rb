require 'rss'
require 'open-uri'
require 'json'

module News
  module Commands
    class GetNews < SlackRubyBot::Commands::Base

      command 'get_news' do |client, data, _match|
        url = 'https://rss.app/feeds/aPyh7dgZjMnh7LeP.xml'
        rss = RSS::Parser.parse(open(url).read, false).items.sample
        client.say(channel: data.channel, text: rss.link)
      end

      command 'get_politics' do |client, data, _match|
        url = 'https://rss.app/feeds/Dk0X526oGrL6c2Rv.xml'
        rss = RSS::Parser.parse(open(url).read, false).items.sample
        client.say(channel: data.channel, text: rss.link)
      end

      command 'get_bussiness' do |client, data, _match|
        url = 'https://rss.app/feeds/tssARKhZatlCihF1.xml'
        rss = RSS::Parser.parse(open(url).read, false).items.sample
        client.say(channel: data.channel, text: rss.link)
      end

      command 'get_entertainment' do |client, data, _match|
        url = 'https://rss.app/feeds/P595TYafGAXO3td4.xml'
        rss = RSS::Parser.parse(open(url).read, false).items.sample
        client.say(channel: data.channel, text: rss.link)
      end

      command 'get_health' do |client, data, _match|
        url = 'https://rss.app/feeds/FD3XTd2WJAPoVzjl.xml'
        rss = RSS::Parser.parse(open(url).read, false).items.sample
        client.say(channel: data.channel, text: rss.link)
      end

      command 'say_hello' do |client, data, _match|
        client.say(channel: data.channel, text: HelloText.say_hello)
      end
      
    end
  end
end

class HelloText
  def self.say_hello
    'Hello! This is a Bot'
  end
end

