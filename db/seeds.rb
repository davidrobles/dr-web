# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |i|
  Post.create(title: "This is the title #{i}", slug: "this-is-the-slug-#{i}",
              body: "<p>This is the body asdfadfa ds fsd f sf s dfs df s df sd f s df s df ssadfasd fa dfasd fas df as df as df asdfasdfadsf asdfas sadfasdf asd f asd fas df as f asd fa sdfasdfasdfasdfas df as df a sd fa sdfasdfasdf asdf as df asd fa sdf asd f asd fs ad f asdfasdfsad fas dfsa..</p>" * rand(8))
end

5.times do |i|
  Project.create(name: "This is the title #{i}", slug: "this-is-the-slug-#{i}",
                 body: "<p>This is the body asdfadfa ds fsd f sf s dfs df s df sd f s df s df ssadfasd fa dfasd fas df as df as df asdfasdfadsf asdfas sadfasdf asd f asd fas df as f asd fa sdfasdfasdfasdfas df as df a sd fa sdfasdfasdf asdf as df asd fa sdf asd f asd fs ad f asdfasdfsad fas dfsa..</p>")
end

# tags = [['Ruby', 'ruby'], ['Ruby on Rails', 'ruby-on-rails'], ['Python', 'python'], ['Clojure', 'clojure']]
# tags.each { |tag| Tag.create(name: tag[0], slug: tag[1]) }

