module GetNews
  class Bot < SlackRubyBot::Bot
    help do
      title 'News Bot'
      desc 'This bot gives you a random news from CNN International'

      command :get_news do
        title 'get_news'
        desc 'Return the url of a random CNN World news'
        long_desc 'Return the url of a random CNN World news'
      end
    end
  end
end