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
#
# end

FactoryBot.define do
  factory :book do
    title { 'Matematika' }
    type { 'Buku Pelajaran'}
    year { 2021 }
  end

  factory :comic, class: Book, aliases: [:novel] do
    title { 'Naruto' }
    type { 'Hiburan' }
    year { 2021 }
  end

  # :koran -> Koran
  factory :ebook, class: Book do
    title { 'E-Book' }
    author_id { 1 }
    type { 'Digital' }
    year { 2021 }
  end
end
