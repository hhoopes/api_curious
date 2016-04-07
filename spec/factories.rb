FactoryGirl.define do
  factory :user do
    email "heidi@example.com"
    and_me_id "b9e65773cfcdadfd"
    first_name "heidi"
    access_token ENV["USER_TOKEN"]
  end
end
