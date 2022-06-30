require './person'
require 'json'
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, parent_permission: true)
    super(0, age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def json_string
    "{\"id\": #{_id}, \"age\": #{_age}, \"classroom\": \"#{classroom}\", " \
      "\"name\": \"#{_name}\", \"parent_permission\": \"#{_parent_permission}\"}"
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

# student_a=Student.new( 23, '11A', 'Camila')
# puts(student_a._id)
# puts(student_a._name)
# puts(student_a._age)
# puts(student_a.can_use_services?)
# puts(student_a.play_hooky)
