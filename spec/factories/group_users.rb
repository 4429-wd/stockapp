FactoryBot.define do
  factory :group_user do
    name {Faker::Team.name}   
  end
end
