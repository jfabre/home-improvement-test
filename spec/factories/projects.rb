FactoryBot.define do
  factory :project do
    name "Bathroom mini makeover"
    description "Begin by ordering your new item..."
    association :owner, factory: :user, strategy: :build
    estimated_effort_level 8  

    trait :public do
      type "public"
    end

    trait :private do
      type "private"
    end

    factory :public_project,  traits: [:public]
    factory :private_project,  traits: [:private]
  end  
end