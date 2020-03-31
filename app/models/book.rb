class Book < ApplicationRecord

  belongs_to :user

  has_one_attached :book_image
  has_one_attached :book_file
  validates :title, presence: true, length: {minimum: 10}

end
