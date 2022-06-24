require './book'
require './classroom'
require './person'
require './rental'
require './teacher'
require './student'

class App
  attr_accessor :people, :books, :rentals

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

  def create_student(age, classroom, name, permission)
    student = Student.new(age, classroom, name, parent_permission: permission)
    puts("Created student id: #{student._id} name: #{student._name}")
    @people << student
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts("Created teacher id: #{teacher._id} name: #{teacher._name}")
  end

  def create_book(title, author)
    book = Book.new(title, author, title)
    @books << book
    puts("Created book id: #{book.id} title: #{book.title} author: #{book.author}")
  end

  def create_rental(date, book_id, person_id)
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
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts("Created rental book ( title: #{book.title}  author: #{book.author}) person: #{person._name}")
  end

  def list_all_rentals(person_id)
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
