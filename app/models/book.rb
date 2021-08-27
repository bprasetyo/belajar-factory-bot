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

  validates :title, :year, presence: true
  # belongs_to :author
  # has_many :sections
  #
  # before_validation do
  #   puts 'model before_validation'
  # end
  #
  # after_validation do
  #   puts 'model after_validation'
  # end
  #
  # after_initialize do
  #   puts 'model after_initialize'
  # end
  #
  # before_save do
  #   puts 'model before_save'
  # end
  #
  # before_create do
  #   puts 'model before_create'
  # end
  #
  # after_save do
  #   puts 'model after_save'
  # end
  #
  # after_create do
  #   puts 'model after_create'
  # end
  #

  def initialize_book
    self.year = Time.now.year
  end
end
