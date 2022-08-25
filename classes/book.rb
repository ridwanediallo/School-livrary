class Book
    attr_reader :rentals
    attr_accessor :title :author

    def initialize(title, author)
      @title = title
      @author = author
      @rentals = []
    end

    def add_rental(rental)
      rental.book = self
      @rentals << rental unless @rentals.include?(rental)
    end

end