require 'date'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @the_date = Date.parse(@date).strftime('%a %d %b %Y')

    @book = book
    @book.rentals << self

    @person = person
    @person.rentals << self
  end
end
