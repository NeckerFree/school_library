require './app'

class Main # rubocop:disable Metrics/CyclomaticComplexity
  def main
    app = App.new
    loop do
      puts("Welcome to School Library App!

            Please choose an option by entering a number:
            1. List all books.
            2. List all people.
            3. Create a person (teacher or student).
            4. Create a book.
            5. Create a rental.
            6. List all rentals for a given person id.
            7. Exit")
      puts('option: ')
      option = gets.chomp.to_i
      system('cls')

      case option
      when 1
        app.list_all_books
      when 2
        app.list_all_people
      when 3
        create_person(app)
      when 4
        puts('Enter title: ')
        title = gets.chomp
        puts('Enter author: ')
        author = gets.chomp
        app.create_book(title, author)
      when 5
        puts('Enter date (YYYY-MM-DD): ')
        date = gets.chomp
        puts('Enter book id: ')
        book_id = gets.chomp.to_i
        puts('Enter person id: ')
        person_id = gets.chomp.to_i
        app.create_rental(date, book_id, person_id)
      when 6
        puts('Enter person id: ')
        person_id = gets.chomp.to_i
        app.list_all_rentals(person_id)
      when 7
        exit
      end
      puts("\n")
    end
  end

  def create_person(app) # rubocop:disable Metrics/CyclomaticComplexity
    puts('Do you want to create a student (1) or a teacher (2)? [Input the number]: ')
    person_type = gets.chomp.to_i
    case person_type
    when 1
      puts('Enter age: ')
      age = gets.chomp
      puts('Enter name: ')
      name = gets.chomp
      puts('Enter classroom: ')
      classroom = gets.chomp
      puts('Has parent permission? [Y/N]: ')
      response = gets.chomp
      permission = response.downcase == 'y'
      app.create_student(age, classroom, name, permission)
    when 2
      puts('Enter age: ')
      age = gets.chomp
      puts('Enter specialization: ')
      specialization = gets.chomp
      puts('Enter name: ')
      name = gets.chomp
      app.create_teacher(age, specialization, name)
    else
      puts('person option not valid')
    end
  end
end

main = Main.new
main.main
