FactoryBot.define do
  factory :user do
    name                 {'やぽ'}
    name_reading         {'ヤポ'}
    nickname             {'yapo'}
    email                {'ya@po'}
    password             {'yapoyapo12'}
    password_confirmation {password}
  end
end
