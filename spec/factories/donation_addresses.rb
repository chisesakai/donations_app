FactoryBot.define do
  factory :donation_address do
    postal_code   {'123-4567'}
    prefecture    {1}
    city          {'やぽ'}
    house_number  {'1-1'}
    building_name {'yapo'}
    price         {2000}
  end
end
