FactoryBot.define do
  factory :user do
    email  Faker::Internet.email
    full_name  "John Smith"
    password "password"
    image "https://robohash.org/user-john-smith?set=set3"
  end

  factory :admin, class: User do
    email Faker::Internet.email
    full_name "Admin"
    password "admin"
    image "https://robohash.org/admin-2?set=set3"
    role "admin"
  end
end