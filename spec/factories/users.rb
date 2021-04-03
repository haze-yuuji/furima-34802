FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'hhh000' }
    password_confirmation { password }
    first_name            { 'ユウじ' }
    last_name             { '櫨' }
    first_name_kana       { 'ユウジ' }
    last_name_kana        { 'ハゼ' }
    birthday              { '1982-08-22' }
  end
end
