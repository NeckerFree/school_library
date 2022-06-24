
require './app'

class Main
    def main
        app=App.new()
        while true
            puts("Welcome to School Library App!

            Please choose an option by entering a number:
            1. List all books.
            2. List all people.
            3. Create a person (teacher or student, not a plain Person).
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
                puts('Do you want to create a student (1) or a teacher (2)? [Input the number]: ')
                personType= gets.chomp.to_i
                if personType==1
                    puts('Enter age: ')
                    age= gets.chomp
                    puts('Enter name: ')
                    name= gets.chomp
                    puts('Enter classroom: ')
                    classroom= gets.chomp
                    puts('Has parent permission? [Y/N]: ')
                    response= gets.chomp
                    permission=response.downcase=='y' ? true: false 
                    app.create_student(age, classroom, name, permission)
                elsif personType==2
                    puts('Enter age: ')
                    age= gets.chomp
                    puts('Enter specialization: ')
                    specialization= gets.chomp
                    puts('Enter name: ')
                    name= gets.chomp
                    app.create_teacher(age, specialization, name)
                else
                    puts('person option not valid')
                end    

            when 4 
                puts('Enter title: ')
                title= gets.chomp
                puts('Enter author: ')
                author= gets.chomp
                app.create_book(title, author)
            when 5 
                puts('Enter date (YYYY-MM-DD): ')
                date= gets.chomp
                puts('Enter book id: ')
                book_id= gets.chomp
                puts('Enter person id: ')
                person_id= gets.chomp
                app.create_rental(date, book_id, person_id)
            when 6 
                puts('Enter person id: ')
                person_id= gets.chomp
                app.list_all_rentals(person_id) 
            when 7 
                exit
            end   
            puts("\n")
        end 
    end    
end

main=Main.new()
main.main