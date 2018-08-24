FactoryBot.define do
  factory :user do
    email "test@example.com"
    password "test12345"

    trait :with_admin do
      admin true
    end
  end

end
