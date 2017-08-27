class Genre < ActiveRecord::Base
  belongs_to :book

  def self.fetch_genre(id)
  	return Genre.where(book_id: id) 
  end
end
