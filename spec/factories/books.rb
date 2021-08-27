# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  author_id  :integer
#  type       :string
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# FactoryBot akan mendefinisikan factory-factory berikut ini: do
#   factory :name, options: {}, do
#
#   end
#   factory :name, class: ...., aliases: [:other_name, ....], do
#
#   end
#
#   factory ....
#   test do
#    .......
#   end
#
# end

FactoryBot.define do
  factory :book do

    year { 2020 }
    book_type { "Pelajaran" }
    # author { create(:author) }
    sequence(:title) do |n|
      "#{year} | #{n}"
    end

    transient do
      pengurangan_tahun { 10 }
    end

    # nama_relasi { create(:nama_factory) }
    # author { create(:author) }
    # sequence(:nama_attributes) { |n| "n" }

    #  callback
    #
    after(:build) do |book|

    end

    after(:create) do |book|

    end

    trait :koran do
      book_type { 'Berita' }
    end

    trait :draft do
      workflow_state { 'Draft' }
    end

    trait :receive do
      workflow_state { 'Receive' }
    end

    factory :stock_order_franchise do

    end

  end
end
