xml.instruct! :xml, version: "1.0", encoding: "utf-8"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "ShowHN Paperboy Digital"
    xml.description "weekly newsletter for 'show HackerNews'"
    xml.link root_url

    xml.item do
      xml.title "ShowHN Paperboy Digital"
      xml.description "ShowHN Digest for #{HackerNewsPost.last_week_time_period[:starting_at].to_s(:short)} -- #{HackerNewsPost.last_week_time_period[:ending_at].to_s(:short)}"
      xml.pubDate HackerNewsPost.last_week_time_period[:ending_at].to_s(:rfc822)
      xml.guid HackerNewsPost.last_week_time_period[:ending_at].to_i.to_s
      xml.link "https://showhn.paperboy.digital/last"

      description = ""
      @posts.each_with_index do |post, index|
        description = "#{description}<br/>#{index + 1}) #{post.title}, score:#{post.score}<br/><a href=#{post.url} ></a>#{post.url}<br/>"
      end

      xml.description do
        xml.cdata! description
      end
    end
  end
end
