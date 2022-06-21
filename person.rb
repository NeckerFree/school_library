class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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

person1 = Person.new(53, 'Elio')
puts(person1._id)
puts(person1._name)
puts(person1._age)
puts(person1.can_use_services?)

person2 = Person.new(10, 'Sebastian')
puts(person2._id)
puts(person2._name)
puts(person2._age)
puts(person2.can_use_services?)

person3 = Person.new(47, '')
puts(person3._id)
puts(person3._name)
puts(person3._age)
puts(person3.can_use_services?)
