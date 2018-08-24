FactoryBot.define do
  factory :article do
    entry_at Time.zone.now
    sequence(:title) { |n| "sample article #{n}" }
    content Faker::Lorem.paragraph
    published false
  end
end
