require_relative 'classes/book'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/rental'


class App

    def initialize()
        puts
        @books = []
        @people = []
        @rentals = []
    end

    def take_input_with_label(label)
       print "#{label}: "
       gets.chomp
    end

    def person_get_option
       puts 'What you want to create:'
       puts "\nPress 1 to add - A teacher Or Press 2 to add - A student"
       puts 'Press any other key to return to main menu'

       input = gets.chomp
       return "\n#{input} is not a valid input to create a person" unless (1..2).include?(input.to_i)

       input.to_i
   end

    def list_all_books
        @books.each.with_index(1) do |book, index|
            puts "\n#{index}.) Book's Title: #{book.title}, Author: #{book.author}"
        end
    end

    def list_all_people()

    @people.each_with_index do |person, index|
      type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "#{index})  [#{type}] Name: #{person.name}, ID: #{person.id}, Age #{person.age}"
    end
    end

  def create_person(option)
    name = take_input_with_label('Name')
    age = take_input_with_label('Age').to_i

    case option
    when 1
      specialization = take_input_with_label('Specialization')
      @people << Teacher.new(specialization, age, name)
      puts 'Teacher Created Successfully'
    when 2
      permission = %w[y Y].include?(take_input_with_label('Has parent permission? [Y/N]'))
      @people << Student.new(age, name, permission)
      puts 'Student Created Successfully'
    end
   end

    def create_book
        title = take_input_with_label('Title')
        author = take_input_with_label('Author')

        @books << Book.new(title, author)
        puts 'Book was created successfully!'
    end


  def take_rental_options(type)
    case type
    when 'book'
      puts "\nSelect a book from the following list by number"
      puts list_all_books
      book = take_input_with_label('Book number').to_i
      return puts 'Invalid book selection!' unless book.between?(1, @books.length)

      @books[book - 1]

    when 'person'
      puts "\nSelect a person from the following list by number (not ID)"
      puts list_all_people(indexed: true)
      person = take_input_with_label('Person number').to_i
      return puts 'Invalid person selection!' unless person.between?(1, @people.length)

      @people[person - 1]

    else
      puts 'Invalid function call'
    end
  end

  def create_rental
    book = take_rental_options('book')
    person = take_rental_options('person')

    puts 'Enter a date'
    date = take_input_with_label('Date, "DD-MM-YYYY"')
    @rentals << Rental.new(date, person, book)
    puts 'Rental Created Successfully!'
  end

  def rentable?
    puts 'Either books or people is empty. Please add one of each' if @people.empty? || @books.empty?
    !@people.empty? && !@books.empty?
  end

  def take_person_id
    return puts 'No rentals available to check. First create a Rental' if @rentals.empty?

    puts 'Enter Person ID to find rentals:'
    take_input_with_label('Person ID').to_i
  end

  def print_rentals(person_id)
    return puts 'No rentals available to check. First create a Rental' if @rentals.empty?

    person = @people.find { |person| person.id == person_id }
    return puts "No rentals found for Person Id: #{person_id}" if person.nil?

    person.rentals.each do |rental|
      puts "\nDate: #{rental.the_date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
# end
