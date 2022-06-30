require './book'
require './classroom'
require './person'
require './rental'
require './teacher'
require './student'
require './base_file'
require 'json'

class App
  def initialize
    @people_file = BaseFile.new('people.json')
    @book_file = BaseFile.new('books.json')
    @rental_file = BaseFile.new('rental.json')
  end

  def list_all_books
    data = @book_file.read_all_records
    if data.empty?
      puts("No books found. \n")
    else
      puts("List of books: \n")
      puts(data)
    end
  end

  def list_all_people
    data = @people_file.read_all_records
    if data.empty?
      puts("No people found. \n")
    else
      puts("List of people: \n")
      puts(data)
    end
  end

  def create_person
    puts('Do you want to create a student (1) or a teacher (2)? [Input the number]: ')
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts('person option not valid')
    end
  end

  def create_student
    parameters = student_input
    student = Student.new(parameters[0], parameters[1], parameters[2], parent_permission: parameters[3])
    student_string = student.json_string
    json_student = JSON.parse(student_string)
    json_student = json_student.to_s.gsub('=>', ': ')
    @people_file.write_object(json_student)
    puts("Created student id: #{student._id} name: #{student._name}")
  end

  def student_input
    puts('Enter age: ')
    age = gets.chomp
    puts('Enter name: ')
    name = gets.chomp
    puts('Enter classroom: ')
    classroom = gets.chomp
    puts('Has parent permission? [Y/N]: ')
    response = gets.chomp
    permission = response.downcase == 'y'
    [age, classroom, name, permission]
  end

  def create_teacher
    parameters = teacher_input
    teacher = Teacher.new(parameters[0], parameters[1], parameters[2])
    teacher_string = teacher.json_string
    json_teacher = JSON.parse(teacher_string)
    json_teacher = json_teacher.to_s.gsub('=>', ': ')
    @people_file.write_object(json_teacher)
    puts("Created teacher id: #{teacher._id} name: #{teacher._name}")
  end

  def teacher_input
    puts('Enter age: ')
    age = gets.chomp
    puts('Enter specialization: ')
    specialization = gets.chomp
    puts('Enter name: ')
    name = gets.chomp
    [age, specialization, name]
  end

  def create_book
    parameters = book_input
    book = Book.new(0, parameters[0], parameters[1])
    book_string = book.json_string
    json_book = JSON.parse(book_string)
    json_book = json_book.to_s.gsub('=>', ': ')
    @book_file.write_object(json_book)
    # @books << book
    puts("Created book id: #{book.id} title: #{book.title} author: #{book.author}")
  end

  def book_input
    puts('Enter title: ')
    title = gets.chomp
    puts('Enter author: ')
    author = gets.chomp
    [title, author]
  end

  def create_rental
    parameters = rental_input
    rental = Rental.new(parameters[0], parameters[1], parameters[2])
    rental_string = rental.json_string
    json_rental = JSON.parse(rental_string)
    json_rental = json_rental.to_s.gsub('=>', ': ')
    @rental_file.write_object(json_rental)
    puts("Created rental book ( title: #{parameters[1].title}  author: #{parameters[1].author}) person: #{parameters[2]._name}") # rubocop:disable Layout/LineLength
  end

  def rental_input # rubocop:disable  Metrics/MethodLength
    puts('Enter date (YYYY-MM-DD): ')
    date = gets.chomp.to_s
    puts('Enter book id: ')
    book_id = gets.chomp.to_i
    puts('Enter person id: ')
    person_id = gets.chomp.to_i
    book_json = JSON.parse(@book_file.find(book_id))
    book = Book.new(book_json['id'], book_json['title'], book_json['author'])
    if book.nil?
      puts("book with id: #{book_id} doesn't exist")
      return
    else
      # puts (book_json)
      puts("id: #{book.id} title: #{book.title} author: #{book.author}")
    end
    person_json = JSON.parse(@people_file.find(person_id))

    person = Person.new(person_json['id'], person_json['age'], person_json['name'])
    if person.nil?
      puts("person with id: #{person_id} doesn't exist")
      return
    else
      # puts(person_json)
      puts("id: #{person._id} name: #{person._name} age: #{person._age}")
    end
    [date, book, person]
  end

  def list_all_rentals
    puts('Enter person id: ')
    person_id = gets.chomp.to_i
    rentals = @rental_file.find_all('person_id', person_id)
    if rentals.empty?
      puts("No rentals found. \n")
    else
      puts('List of rentals: ')
      puts(rentals)
    end
  end
end
