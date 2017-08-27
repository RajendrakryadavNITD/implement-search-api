class BooksService

  def fetch_search_result(params)
    @search_query = Book.all
    
    if params['search'].present?
      @search = params['search'].downcase
      @search_query = @search_query.where('lower(books.name) LIKE :search', search: "%#{@search}%")
    end
    
    @books = @search_query.order(created_at: :desc)
  end
end