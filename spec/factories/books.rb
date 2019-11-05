FactoryBot.define do
  factory :book do
    title { 'Book' }
    author { 'Author' }
    type { 'Type' }
    year { Time.now.year }
  end
end