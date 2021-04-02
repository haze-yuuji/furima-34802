FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'hhh000'}
    password_confirmation {password}
    first_name            {'櫨'}
    last_name             {'ユウじ'}
    first_name_kana       {'ハゼ'}
    last_name_kana        {'ユウジ'}
    birthday              {'1982-08-22'}
  end
end

   