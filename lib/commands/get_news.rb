require 'rss'
require 'open-uri'
require_relative 'topic'

module News
  module Commands
    class GetNews < SlackRubyBot::Commands::Base
      command 'get_news' do |client, data, match|
        expression = match[:expression]
        if expression.nil?
          url = 'https://rss.app/feeds/swb9VWfLBCkRtWLo.xml'
          rss = RSS::Parser.parse(URI.open(url).read, false).items.sample
          client.say(channel: data.channel, text: rss.link)
        else
          news_topic = Topic.new
          news = news_topic.search_topic(expression)
          if news.nil?
            client.say(text: "Sorry I couldn\'t find what you were looking for.\n" \
            "Type 'help get_news' to see the topics available", channel: data.channel)
          else
            url = news
            rss = RSS::Parser.parse(URI.open(url).read, false).items.sample
            client.say(channel: data.channel, text: rss.link)
          end
        end
      end
    end
  end
end
