require_relative 'rental'
class Book
  attr_accessor :id, :title, :author, :rentals

  # attr_reader :id, :rentals
  def initialize(author, title)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals.push(rental)
  end

  def _id
    @id
  end
end
