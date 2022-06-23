require './book'
require './classroom'
require './person'
require './rental'
require './teacher'
require './student'

classroom = Classroom.new('11A')
puts(classroom.label)

student_a = Student.new(23, '11A', 'Camila')
student_b = Student.new(34, '11A', 'Andres')
classroom.add_student(student_a)
classroom.add_student(student_b)
puts("Students in classroom: #{classroom.students.count}")
puts(classroom.students.map(&:_name))
puts("\n")

book_one = Book.new('Cryme and Punishment', 'Fedor Dostoviesky')
book_two = Book.new('THE HOTEL NANTUCKET', 'Elin Hilderbrand')
book_three = Book.new('SPARRING PARTNERS', 'John Grisham')

person_one = Person.new(45, 'maximilianus')
person_two = Person.new(22, 'catalina')
Rental.new('2022-06-22', book_one, person_one)
Rental.new('2022-06-20', book_two, person_two)
Rental.new('2022-06-23', book_three, person_one)

puts("Rentals person 1: #{person_one.rentals.count}")
puts(person_one.rentals.map(&:date))
puts(person_one.rentals.map { |rental| rental.book.title })
puts("\n")

puts("Rentals person 2: #{person_two.rentals.count}")
puts(person_two.rentals.map { |rental| rental.book.title })
