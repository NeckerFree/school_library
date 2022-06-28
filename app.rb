require './book'
require './classroom'
require './person'
require './rental'
require './teacher'
require './student'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts("No books found. \n")
    else
      puts("List of books: \n")
      puts(@books.map { |book| "id: #{book.id} title: #{book.title} author: #{book.author}" })
    end
  end

  def list_all_people
    if @people.empty?
      puts("No people found. \n")
    else
      puts("List of people: \n")
      puts(@people.map { |person| "id: #{person._id} name: #{person._name} age: #{person._age}" })
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
    puts("Created student id: #{student._id} name: #{student._name}")
    @people << student
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
    @people << teacher
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
    book = Book.new(parameters[0], parameters[1])
    @books << book
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
    @rentals << rental
    puts("Created rental book ( title: #{parameters[1].title}  author: #{parameters[1].author}) person: #{parameters[2]._name}") # rubocop:disable Layout/LineLength
  end

  def rental_input # rubocop:disable  Metrics/MethodLength
    puts('Enter date (YYYY-MM-DD): ')
    date = gets.chomp
    puts('Enter book id: ')
    book_id = gets.chomp.to_i
    puts('Enter person id: ')
    person_id = gets.chomp.to_i
    book = @books.find { |b| b._id == book_id }
    if book.nil?
      puts("book with id: #{book_id} doesn't exist")
      return
    else
      puts("id: #{book.id} title: #{book.title} author: #{book.author}")
    end
    person = @people.find { |p| p._id == person_id }
    if person.nil?
      puts("person with id: #{person_id} doesn't exist")
      return
    else
      puts("id: #{person._id} name: #{person._name} age: #{person._age}")
    end
    [date, book, person]
  end

  def list_all_rentals
    puts('Enter person id: ')
    person_id = gets.chomp.to_i
    person = @people.find { |p| p._id == person_id }
    if person.nil?
      puts("No rentals found. \n")
    else
      puts('List of rentals: ')
      puts(
        person.rentals.map { |r| "person: #{r.person._name} book ( title: #{r.book.title}  author: #{r.book.author})" }
      )
    end
  end
end
