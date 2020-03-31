module GetNews
  class Bot < SlackRubyBot::Bot
    help do
      title 'NewsBot'
      desc 'A Slack Bot that returns news from CNN International'

      command :get_news do
        title 'get_news'
        desc 'Returns the url of news from CNN'
        long_desc "After typing this command, add a space and type one of the following topics in lowercase:\n\n"\
        "world\n\n"\
        "politics\n\n"\
        "bussiness\n\n"\
        "entertainment\n\n"\
        "health"
      end
    end
  end
end