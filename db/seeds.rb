# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Article.delete_all

1.upto(10).each do |index|
  email = Faker::Internet.email
  username = email.split('@').first
  u = User.create!(
    username: username,
    email: email,
    password: 'change123',
    password_confirmation: 'change123'
  )

  1.upto(rand(20)).each do |article_index|
    a = u.articles.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph(3),
      description: Faker::Lorem.paragraph(1)
    )
  end
end
