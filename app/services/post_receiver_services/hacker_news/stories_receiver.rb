module PostReceiverServices
  module HackerNews
    class StoriesReceiver
      require 'httparty'

      def initialize
      end

      def call
        url = 'https://hacker-news.firebaseio.com/v0/showstories.json?print=pretty'
        result = HTTParty.get(url)
      rescue HTTParty::Error => e
        OpenStruct.new({ success?: false, error: e })
      else
        OpenStruct.new({ success?: true, payload: result })
      end
    end
  end
end
