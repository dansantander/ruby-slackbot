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
      next if topic != k.to_s
        return v
    end
    nil
  end
end
