require './person'
class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name)
    super(0, age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def json_string
    "{\"id\": #{_id}, \"age\": #{_age}, \"specialization\": \"#{specialization}\", \"name\": \"#{_name}\"}"
  end
end
# teacher_a = Teacher.new(33, 'Math', 'Andrew')
# puts(teacher_a._id)
# puts(teacher_a._name)
# puts(teacher_a._age)
# puts(teacher_a.can_use_services?)

# teacher_b = Teacher.new(39, 'English', 'Marco')
# puts(teacher_b._id)
# puts(teacher_b._name)
# puts(teacher_b._age)
# puts(teacher_b.can_use_services?)
