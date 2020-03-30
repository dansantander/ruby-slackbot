module GetNews
  class Bot < SlackRubyBot::Bot
    help do
      title 'News Bot'
      desc 'This bot gives you a random movie from fmovies.to'

      command :get_news do
        title 'get_news'
        desc 'Return the url of a random cnn world news'
        long_desc 'Return the url of a random cnn world news'
      end
    end
  end
end