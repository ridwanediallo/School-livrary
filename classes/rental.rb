require 'date'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date

    date = Date.parse(@date).strftime('%a %d %b %Y')

    @book = book
    @book.rentals.push(self)

    @person = person
    @person.rentals.push(self)
    # @person.rentals << self
  end
end
