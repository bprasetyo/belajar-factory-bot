# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Section < ApplicationRecord

  belongs_to :book, inverse_of: :sections

end