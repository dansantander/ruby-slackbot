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

