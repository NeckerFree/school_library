require_relative 'book'
require_relative 'person'

class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self
    # book.rentals.push(self) unless book.rentals.include?(self)

    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end
end
