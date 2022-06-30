require_relative 'book'
require_relative 'person'

class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    # book.rentals << self
    # book.rentals.push(self) unless book.rentals.include?(self)

    @person = person
    # person.rentals.push(self) unless person.rentals.include?(self)
  end

  def json_string
    "{\"date\": \"#{date}\", \"person_id\": #{person._id}, \"name\": " \
      "\"#{person._name}\", \"book_id\": #{book.id}, \"book_title\": " \
      "\"#{book.title}\", \"book_author\": \"#{book.author}\"}"
  end
end
