xml.instruct!
  xml.rss "version" => "2.0",
    "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
    xml.channel do
      xml.title 'David Robles Website'
      xml.link posts_url
      xml.pubDate CGI.rfc1123_date(@posts.first.updated_at)
      xml.description h("Latest posts")
      @posts.each do |post|
        xml.item do
          xml.title post.title
          xml.link post_url(post)
          xml.description post.body
          xml.pubDate CGI.rfc1123_date(post.updated_at)
          xml.guid post_url(post)
          xml.author "David Robles"
        end
      end
    end
  end
