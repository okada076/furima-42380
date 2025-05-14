FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { 'a12345' }
    password_confirmation { 'a12345' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_date            { '1990-01-01' }
  end
end
