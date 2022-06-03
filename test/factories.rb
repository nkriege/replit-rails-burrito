FactoryBot.define do
  factory :filling do
    sequence(:name) { |n| "filling#{n}" }
    sequence(:description) { |n| "Description of filling#{n}" }
    price { 1.00 }
    calories { 100 }
  end

  factory :order do
    first_name { 'First' }
    last_name { 'Last' }
    email { 'email@test.com' }
    phone { '+12065551212' }
    tortilla { 'Corn' }
    rice { 'Brown' }
    beans { 'Black' }
    filling
  end
end
