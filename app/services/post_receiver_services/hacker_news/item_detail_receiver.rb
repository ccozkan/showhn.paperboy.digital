module PostReceiverServices
  module HackerNews
    class ItemDetailReceiver
      require 'httparty'

      def initialize(item_id)
        @item_id = item_id
      end

      def call
        url = "https://hacker-news.firebaseio.com/v0/item/#{@item_id}.json?print=pretty"
        result = HTTParty.get(url)
      rescue HTTParty::Error => e
        OpenStruct.new({ success?: false, error: e })
      else
        OpenStruct.new({ success?: true, payload: result })
      end
    end
  end
end
