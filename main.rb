require_relative 'app'

def main_menu
    puts "\n\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
end

def take_input
    input = gets.chomp
    return "\n#{input} is not a valid input. Please try again" unless (1..7).include?(input.to_i)

    input.to_i

  end

def main
 puts 'Welcome to School livrary app!'

 app = App.new()

 input = nil

 while input != 7
    main_menu()
    input = take_input

    case input
    when 1
       app.list_all_books
    when 2
       app.list_all_people
    when 3
      option = app.person_get_option
      app.create_person(option) unless option.is_a? String
      puts option if option.is_a? String
    when 4
       app.create_book
    when 5
       app.create_rental if app.rentable?
    when 6
       app.list_all_books
    else
        puts input unless input.is_a?(Integer)
    end

 end

 puts "Goodbye!!"


end

main
