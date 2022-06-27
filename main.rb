require './app'

class Main
  def main # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    app = App.new
    loop do
      show_menu
      option = gets.chomp.to_i
      system('cls')

      case option
      when 1
        app.list_all_books
      when 2
        app.list_all_people
      when 3
        app.create_person
      when 4
        app.create_book
      when 5
        app.create_rental
      when 6
        app.list_all_rentals
      when 7
        exit
      end
      puts("\n")
    end
  end

  def show_menu
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
  end
end

main = Main.new
main.main
