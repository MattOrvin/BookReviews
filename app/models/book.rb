class Book < ApplicationRecord
    validates :title, uniqueness: {message: "A book with this title already exists. Please enter another."}

    has_many :book_reviews
    has_many :users, through: :book_reviews
end
