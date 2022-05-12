FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    family_name           { '佐藤' }
    family_name_kana      { 'サトウ' }
    birthday              { '2022-01-01' }
  end
end
