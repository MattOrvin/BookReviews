class User < ApplicationRecord
    validates :name, uniqueness: true
    has_secure_password

    has_many :book_reviews
    has_many :books, through: :book_reviews
end
