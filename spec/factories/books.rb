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
  factory :buku_pelajaran, class: Book do
    title { 'Matematika' }
    author_id { 1 }
    type { 'Buku Pelajaran'}
    year { 2021 }
  end

  factory :comic, class: Book do
    title { 'Naruto' }
    author_id { 2 }
    type { 'Hiburan' }
    year { 2021 }
  end

  # :book -> Book
  factory :book, class: Book, aliases: [:buku] do
    title { 'Matematika' }
    author_id { 1 }
    type { 'Buku Pelajaran'}
    year { 2021 }
  end

  # :koran -> Koran
  factory :koran, class: Book do
    title { 'Kompas' }
    author_id { 1 }
    type { 'Berita' }
    year { 2021 }
  end
end
