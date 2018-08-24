Article.create!(entry_at: Time.zone.now,
                title: "ブログをリニューアルしました",
                content: Faker::Lorem.paragraph(10),
                published: true)

99.times do |n|
  Article.create!(entry_at: (n + 1).days.ago,
                  title: "Sample Article#{n}",
                  content: Faker::Lorem.paragraph(10),
                  published: true)
end