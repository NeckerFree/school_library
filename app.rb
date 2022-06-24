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
            puts("No books found \n")
        else
            puts("Books list: \n")
            puts(@books.map { |book| "id: #{book.id} title: #{book.title} author: #{book.author}" })
        end 
    end

    def list_all_people
        if @people.empty?
            puts("No people found \n")
        else
            puts("People list: \n")
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
        puts("Created student id: #{teacher._id} name: #{teacher._name}")
    end  
    
    def create_book(title, author)
        book= Book.new(title, author)
        @books << book
        puts("Created book id: #{book.id} title: #{book.title} author: #{book.author}")
    end    
    
    def create_rental(date, book_id, person_id)
        book=@books.filter{ |b| b.id==book_id}
        if book==nil
            puts("book with id: #{book_id} doesn't exist")
            return
        end    
        person=@people.filter{ |p| p._id==person_id}
        if person==nil
            puts("person with id: #{person_id} doesn't exist")
            return
        end    
        rental=Rental.new(date, book, person)
        @rentals << rental
        puts("Created rental book ( name: #{book.name} title: #{book.title}) person: #{person._name}")
    end  
    
    def list_all_rentals(person_id) 
        person=@people.find{ |p| p.id==person_id}
        if person==nil
            puts("No rentals found \n")
        else    
            puts(person.rentals.map{ |r| r.book.name r.book.title r.person._name})
        end    
    end    
end