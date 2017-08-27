class Book < ActiveRecord::Base
	def self.save_book_and_review
		
		5000.times do
			@book = Book.new
			@book.name = Faker::Book.title 
			@book.short_description = Faker::Lorem.paragraph
			@book.long_description = Faker::Lorem.paragraph
			@book.chapter_index = Faker::Number.digit
			@book.date_of_publication = Faker::Date.backward(5000)
			@book.save
			3.times do
				@genre = Genre.new
				@genre.name = Faker::Book.genre
				@genre.book_id = @book.id
				@genre.save
			end
			5.times do
				@review = Review.new
				@review.reviewer_name = Faker::Name.name
				@review.rating = Faker::Number.between(1, 5)
				@review.review_title = Faker::Lorem.sentences(1)
				@review.review_description = Faker::Lorem.paragraphs
				@review.book_id = @book.id
				@review.save
			end
		end		
	end

	def self.search_book(params)
	    @search_query = Book.all
	    
	    if params['search'].present?
	      @search = params['search'].downcase
	      @search_query = @search_query.where('lower(books.name) LIKE :search', search: "%#{@search}%")
	    end
	    
	    @books = @search_query.order(created_at: :desc)
	  end
end
