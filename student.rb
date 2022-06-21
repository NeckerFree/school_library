require './person'
class Student < Person
  def initialize(age, classroom, name)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

# student_a=Student.new( 23, '11A', 'Camila')
# puts(student_a.id)
# puts(student_a.name)
# puts(student_a.age)
# puts(student_a.can_use_services?)
# puts(student_a.play_hooky)
