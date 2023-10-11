FactoryBot.define do
  factory :user do
   f_name { Faker::Name.first_name }
   l_name { Faker::Name.last_name }
   email { Faker::Internet.email(domain: 'gmail.com') }
   password_digest { Faker::Internet.uuid }
   end
 end