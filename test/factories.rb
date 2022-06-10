FactoryBot.define do
  factory :filling do
    sequence(:name) { |n| "filling#{n}" }
    sequence(:description) { |n| "Description of filling#{n}" }
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

      factory :order_with_filling do
        filling

        factory :order_with_delivery do
          delivery { true }
          delivery_street1 { '111 Main Street' }
          delivery_city { 'Seattle' }
          delivery_state { 'WA' }
          delivery_zip { '98101' }
        end
      end
    end
  end
end
