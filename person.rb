require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_reader :rentals

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id.zero? ? Random.rand(1..1000) : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
    @rentals = []
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rentals.push(rental)
  end

  def correct_name
    @name
  end

  def _id
    @id
  end

  def _name
    @name
  end

  def _age
    @age
  end

  def _parent_permission
    @parent_permission
  end

  def put_name=(name)
    @name = name
  end

  def put_age=(age)
    @age = age
  end

  def can_use_services?
    if of_age? && @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end

# Check if you managed to decorate your person
# person = Person.new(22, 'maximilianus')
# puts(person.correct_name)
# capitalized_person = CapitalizeDecorator.new(person)
# puts(capitalized_person.correct_name)
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts(capitalized_trimmed_person.correct_name)
