class Api::SearchesController < ApplicationController
	  skip_before_action :verify_authenticity_token

	def create
		@author = Author.save_author
		@book = Book.save_book_and_review
		respond_to do |format|
    	    format.json { render json: { "status" => true, "message" =>"All good" }, status: :created }
	    end
	end

	def search
		@search_in_book = Book.search_book(params)
		@search_in_author = Author.search_author(params)
		@search_in_review = Review.search_review(params)
		@result = []
		if @search_in_book.present?
			@search_in_book.each do |book|
				@book = book.to_json
				@book = JSON.parse(@book)
				@genre = Genre.fetch_genre(book.id)
				@book[:genre] = @genre
				@review = Review.fetch_reviews(book.id)
				@book[:review] = @review
				@result.push(@book)
			end
			respond_to do |format|
	    	    format.json { render json: { "status" => true, "data" =>@result }, status: :created }
		    end
		elsif @search_in_author.present?
			respond_to do |format|
	    	    format.json { render json: { "status" => true, "data" =>@search_in_author }, status: :created }
		    end
		elsif @search_in_review.present?
			respond_to do |format|
	    	    format.json { render json: { "status" => true, "data" =>@search_in_review }, status: :created }
		    end
		else
			respond_to do |format|
	    	    format.json { render json: { "status" => true, "data" =>"no result found" }, status: :created }
		    end
		end
	end
end
