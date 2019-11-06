class BookReview < ApplicationRecord
    validates :text, presence: true
    validates :rating, numericality: {less_than_or_equal_to: 5,  only_integer: true}
    
    belongs_to :user
    belongs_to :book
end
