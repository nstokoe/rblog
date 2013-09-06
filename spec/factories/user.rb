FactoryGirl.define do
  factory :user, class: User do
    sequence(:name) { Faker::Name.name }
    sequence(:email) { Faker::Internet.safe_email }
    password '123456'
    password_confirmation { password }
  end
end