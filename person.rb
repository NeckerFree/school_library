class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name=(name)
    @name = name
  end

  def age=(age)
    @age = age
  end

  def can_use_services?
    if is_of_age? && @parent_permission
      true
    else
      false
    end
  end

  private

  def is_of_age?
    if @age >= 18
      true
    else
      false
    end
  end
end

person1 = Person.new(53, 'Elio')
puts(person1.id)
puts(person1.name)
puts(person1.age)
puts(person1.can_use_services?)

person2 = Person.new(10, 'Sebastian')
puts(person2.id)
puts(person2.name)
puts(person2.age)
puts(person2.can_use_services?)

person3 = Person.new(47, '')
puts(person3.id)
puts(person3.name)
puts(person3.age)
puts(person3.can_use_services?)
