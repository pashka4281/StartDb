xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Your Blog Title"
    xml.description "A blog about software and chocolate"
    xml.link people_url

    for person in @persons
      xml.item do
        xml.title person.name
        xml.description "post.content"
        xml.pubDate person.created_at.to_s(:rfc822)
        xml.link person_url(person)
        xml.guid person_url(person)
      end
    end
  end
end