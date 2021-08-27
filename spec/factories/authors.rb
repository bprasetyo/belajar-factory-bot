FactoryBot.define do
  factory :author do
    name { 'Author' }

    trait :koran do
      name { 'Author Koran' }
    end
  end
end