FactoryBot.define do
  factory :book do

    title { "Pemrograman RSpec" }
    year { 2021 }
    book_type { "Komputer" }
    author { create(:author) }
  end
end
