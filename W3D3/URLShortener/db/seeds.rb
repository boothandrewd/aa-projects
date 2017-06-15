
User.destroy_all
user1 = User.create(:email => "CJ")
user2 = User.create(:email => "Flarnie")
user3 = User.create(:email => "Jeff")
user4 = User.create(:email => "Georges St. Pierre")
user5 = User.create(:email => "Ned")

ShortenedUrl.destroy_all
url1 = ShortenedUrl.create_short_url(user1, 'https://whatever.google.com')
url2 = ShortenedUrl.create_short_url(user1, 'http://andrewdbooth.me')
url3 = ShortenedUrl.create_short_url(user2, 'http://lmnorecords.com')
url4 = ShortenedUrl.create_short_url(user4, 'https://whatever.google.com')

Visit.destroy_all
Visit.record_visit!(user1, url1)
Visit.record_visit!(user1, url1)
Visit.record_visit!(user2, url2)
Visit.record_visit!(user2, url1)
