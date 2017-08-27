class Review < ActiveRecord::Base
  belongs_to :book

  def self.fetch_reviews(id)
  	return Review.where(book_id: id)
  end

  def self.search_review(params)
	    @search_query = Review.all    
	    if params['search'].present?
	      @search = params['search'].downcase
	      @search_query = @search_query.where('lower(reviews.reviewer_name) LIKE :search', search: "%#{@search}%")
	    end
	    @books = @search_query.order(created_at: :desc)
	end
end
