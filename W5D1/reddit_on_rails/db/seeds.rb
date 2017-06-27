require 'faker'

[User, Post, PostSub, Sub, Comment].map(&:destroy_all)

u1 = User.create(username: Faker::Pokemon.name, password: Faker::Pokemon.location)
u2 = User.create(username: Faker::Pokemon.name, password: Faker::Pokemon.location)
u3 = User.create(username: Faker::Pokemon.name, password: Faker::Pokemon.location)
u4 = User.create(username: Faker::Pokemon.name, password: Faker::Pokemon.location)

s1 = Sub.create(title: 'Star Wars', description: Faker::StarWars.quote, user_id: u1.id)
s2 = Sub.create(title: 'Twin Peaks', description: Faker::TwinPeaks.quote, user_id: u2.id)

s1.posts << Post.create(user_id: u3.id, title: Faker::StarWars.quote)
s1.posts << Post.create(user_id: u4.id, title: Faker::StarWars.quote)
s2.posts << Post.create(user_id: u3.id, title: Faker::TwinPeaks.quote)
s2.posts << Post.create(user_id: u4.id, title: Faker::TwinPeaks.quote)

c1 = Comment.create(content: Faker::ChuckNorris.fact, user_id: u1.id, post_id: s1.posts.first.id)
c2 = Comment.create(content: Faker::ChuckNorris.fact, user_id: u4.id, post_id: s1.posts.first.id, parent_comment_id: c1.id)
c3 = Comment.create(content: Faker::ChuckNorris.fact, user_id: u2.id, post_id: s1.posts.first.id, parent_comment_id: c2.id)
c4 = Comment.create(content: Faker::ChuckNorris.fact, user_id: u3.id, post_id: s1.posts.first.id, parent_comment_id: c3.id)
c5 = Comment.create(content: Faker::ChuckNorris.fact, user_id: u4.id, post_id: s1.posts.first.id, parent_comment_id: c2.id)
