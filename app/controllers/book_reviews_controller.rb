class BookReviewsController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:index, :show]

    def index
      @book_reviews = BookReview.all
    end

    def show
      @book_review = BookReview.find_by(id: params[:id])
      # @user = User.find_by(id: params[:id])
    end

    def new
      @book_review = BookReview.new
      @books = Book.all
      @users = User.all
    end

    def create
      @book_review = BookReview.new(book_review_params)
      @books = Book.all
      @users = User.all

      if @book_review.save
        redirect_to book_reviews_path
      else
        @errors = @book_review.errors.full_messages
        render :new
      end
    end

    def edit
      @book_review = BookReview.find(params[:id])
      @books = Book.all
      @users = User.all
    end

    def update
      @book_review = BookReview.find(params[:id])
      @book_review.assign_attributes(book_review_params)

      if @book_review.save 
        redirect_to book_reviews_path
      else
        @errors = @book_review.errors.full_messages
        render :new
      end
    end

    def destroy
      @book_review = BookReview.find(params[:id])
      @book_review.destroy
      redirect_to book_reviews_path
    end

    private

    # def require_login
    #   @book_review = BookReview.find_by(id: params[:id])
    #   return head(:forbidden) unless session.include? :user_id && current_user.id == @book_review.user.user_id
    #   ^ this code returns forbidden every time. Need to find different logic/syntax
    # end

    def book_review_params
      params.require(:book_review).permit(:text, :rating, :book_id, :user_id, :id)
    end
end
