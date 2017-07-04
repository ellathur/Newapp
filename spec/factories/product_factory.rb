
FactoryGirl.define do

  sequence(:id) { |n| "#{n}" }

  factory :product do
    name "Generated coffee"
    image_url "app/assets/images/coffee.jpg"
    price "30.00"
    colour "black"
    description "abc"
    id
  end
end
