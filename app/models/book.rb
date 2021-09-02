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
class Book < ApplicationRecord

  # belongs_to :author

  # has_many :sections, inverse_of: :book, dependent: :destroy
  # accepts_nested_attributes_for :sections, allow_destroy: true

  validates :title, :year, presence: true

  def initialize_book
    self.year = Time.now.year
  end
end
