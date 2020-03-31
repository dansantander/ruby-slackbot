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

      
      command 'get_news_test' do |client, data, match|
        expression = match[:expression]
        if expression.nil?
          url = 'https://rss.app/feeds/swb9VWfLBCkRtWLo.xml'
          rss = RSS::Parser.parse(open(url).read, false).items.sample
          client.say(channel: data.channel, text: rss.link)
        else 
          news_topic = Topic.new
          news = news_topic.search_topic(expression)
          if news.nil?
            client.say(text: "Sorry I couldn\'t find what you were looking for.\n" \
            "Type 'help news topics' to see the topics available", channel: data.channel)
          else
            url = news
            rss = RSS::Parser.parse(open(url).read, false).items.sample
            client.say(channel: data.channel, text: rss.link)
          end
        end
      end
      

      command 'say_hi' do |client, data, _match|
        client.say(channel: data.channel, text: Hello.say_hi)
      end
      
    end
  end
end

class Hello
  def self.say_hi
    'Hello! Welcome to NewsBot!'
  end
end


class Topic
  def initialize
    @valid_topics = {
      world: "https://rss.app/feeds/aPyh7dgZjMnh7LeP.xml",
      politics: "https://rss.app/feeds/Dk0X526oGrL6c2Rv.xml" ,
      bussiness: "https://rss.app/feeds/tssARKhZatlCihF1.xml",
      entertainment: "https://rss.app/feeds/P595TYafGAXO3td4.xml",
      health: "https://rss.app/feeds/FD3XTd2WJAPoVzjl.xml"
    }
  end

  def search_topic(topic)
    topic.downcase!
    @valid_topics.each do |k, v|
      return topic == k.to_s ? v : nil
    end
  end
end
