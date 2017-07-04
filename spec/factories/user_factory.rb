FactoryGirl.define do

  sequence(:email) { |n| "user#{n}@yahoo.co.uk" }
  sequence(:password) { |n| "1234567890#{n}" }

  factory :user do
    email
    password #{}"1234567890"
    first_name "Peter"
    last_name "Example"
    admin false

    factory :admin do
      admin true
    end
   end
end
