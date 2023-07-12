FactoryBot.define do
  factory :user do
    nickname { "JohnDoe" }
    email { "john.doe@example.coppwpo" }
    password {'a00000'}
    password_confirmation {password}
    last_name { "あ" }
    first_name { "あ" }
    kana_last_name { "ア" }
    kana_first_name { "ア" }
    birth_date { Date.new(1990, 1, 1) }
  end
end
