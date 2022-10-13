xml.instruct! :xml, version: "1.0", encoding: "utf-8"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "ShowHN Paperboy Digital"
    xml.description "weekly digest for 'show HackerNews'"
    xml.link root_url

    @posts.each_with_index do |post, index|
      xml.item do
        xml.title post.title
        xml.description "score: #{post.score}, ranking: ##{index + 1} 🚲🗞 btyb showhnpaperboy.digital"

        xml.link "https://news.ycombinator.com/item?id=#{post.external_id}"
        xml.pubDate HackerNewsPost.last_week_time_period[:ending_at].to_s(:rfc822)
        xml.guid HackerNewsPost.last_week_time_period[:ending_at].to_i.to_s
      end
    end
  end
end
