# spec/newsbot_spec.rb

require_relative './lib/commands/topic'

describe Topic do
  let(:topic) { Topic.new }

  describe 'search_topic' do
    it 'returns the value of the key wich if there is a match with the input value ' do
      expect(topic.search_topic('world')).to eql('https://rss.app/feeds/aPyh7dgZjMnh7LeP.xml')
    end
  end

  describe 'search_topic' do
    it 'returns the value of the key wich if there is a match with the input value ' do
      expect(topic.search_topic('politics')).to eql('https://rss.app/feeds/Dk0X526oGrL6c2Rv.xml')
    end
  end

  describe 'search_topic' do
    it 'returns the value of the key wich if there is a match with the input value ' do
      expect(topic.search_topic('bussiness')).to eql('https://rss.app/feeds/tssARKhZatlCihF1.xml')
    end
  end

  describe 'search_topic' do
    it 'returns the value of the key wich if there is a match with the input value ' do
      expect(topic.search_topic('entertainment')).to eql('https://rss.app/feeds/P595TYafGAXO3td4.xml')
    end
  end

  describe 'search_topic' do
    it 'returns the value of the key wich if there is a match with the input value ' do
      expect(topic.search_topic('health')).to eql('https://rss.app/feeds/FD3XTd2WJAPoVzjl.xml')
    end
  end

  describe 'search_topic' do
    it 'returns nil if the input value is not contained in the topics hash' do
      expect(topic.search_topic('whatever')).to eql(nil)
    end
  end
end
