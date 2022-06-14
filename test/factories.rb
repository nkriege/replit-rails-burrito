FactoryBot.define do
  factory :meat do
    sequence(:name) { |n| "meat#{n}" }
    sequence(:description) { |n| "Description of meat#{n}" }
    price { 1.00 }
    calories { 100 }
  end

  factory :order do
    name_first { 'First' }
    name_last { 'Last' }
    email { 'email@test.com' }
    phone { '+12065551212' }

    factory :order_with_ingredients do
      tortilla { 'Corn' }
      rice { 'Brown' }
      beans { 'Black' }

      factory :order_with_meat do
        meat

        factory :order_with_delivery do
          delivery { true }
          address_street1 { '111 Main Street' }
          address_city { 'Seattle' }
          address_state { 'WA' }
          address_zip { '98101' }
        end
      end
    end
  end
end
