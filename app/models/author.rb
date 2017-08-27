class Author < ActiveRecord::Base
	def self.save_author
		@author = Author.new
		1000.times do
			@author.name = Faker::Book.author
			@author.author_bio = Faker::VentureBros.quote
			@author.profile_pic = Faker::Avatar.image
			@author.academics = Faker::Lorem.sentence
			@author.awards = Faker::Lorem.paragraph
			@author.save
		end
	end

	def self.search_author(params)
	    @search_query = Author.all    
	    if params['search'].present?
	      @search = params['search'].downcase
	      @search_query = @search_query.where('lower(authors.name) LIKE :search', search: "%#{@search}%")
	    end
	    @books = @search_query.order(created_at: :desc)
	end
end
