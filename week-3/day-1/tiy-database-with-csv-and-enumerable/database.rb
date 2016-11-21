require 'csv'

class Person
  attr_accessor :name, :phone_number, :address, :position, :salary, :slack_account, :github_account
end

class Database
  def initialize
    @people = []

    # call the method `load_people`
    load_people
  end

  def load_people
    CSV.foreach("employees.csv", headers: true) do |current_line_of_csv|
      person = Person.new

      person.name           = current_line_of_csv["name"].to_s
      person.phone_number   = current_line_of_csv["phone"].to_s
      person.position       = current_line_of_csv["position"].to_s
      person.salary         = current_line_of_csv["salary"].to_s
      person.address        = current_line_of_csv["address"].to_s
      person.slack_account  = current_line_of_csv["slack"].to_s
      person.github_account = current_line_of_csv["github"].to_s

      @people << person
    end
  end

  def save_people
    csv = CSV.open("employees.csv", "w")
    csv.add_row %w(name phone address position salary slack github)

    @people.each do |person|
      csv.add_row [person.name, person.phone_number, person.address, person.position, person.salary, person.slack_account, person.github_account]
    end

    csv.close
  end

  def add_person
    puts "What is the name of the person you wish to add?"
    search_name = gets.chomp

    matching_people = @people.select { |person| person.name == search_name }
    if matching_people.any?
      puts "We already have a #{search_name} in our database"
    else
      person = Person.new

      person.name = search_name

      puts "What is the person's address?"
      person.address = gets.chomp

      puts "What is the person's salary?"
      person.salary = gets.chomp

      puts "What is the person's phone number?"
      person.phone_number = gets.chomp

      puts "What is the person's position?"
      person.position = gets.chomp

      puts "What is the person's slack account?"
      person.slack_account = gets.chomp

      puts "What is the person's github account?"
      person.github_account = gets.chomp

      @people << person
      save_people
    end
  end

  def search_person
    puts "What are you looking for (I'll search the name, github, and slack accounts)"
    search_text = gets.chomp

    matching_people = @people.select { |person| person.name.include?(search_text) || person.slack_account == search_text || person.github_account == search_text }
    if matching_people.empty?
      puts "Didn't find anyone"
    else
      matching_people.each do |person|
        print_person(person)
      end
    end
  end

  def delete_person
    puts "What name are you looking to delete?"
    search_name = gets.chomp

    inital_count = @people.length
    @people.delete_if { |person| person.name == search_name }

    if @people.length != inital_count
      puts "I deleted #{search_name} from the database"
      save_people
    else
      puts "Sorry, that person isn't there"
    end
  end

  def print_person(person)
    puts "Name:      #{person.name}"
    puts "Salary:    #{person.salary}"
    puts "Address:   #{person.address}"
    puts "Position:  #{person.position}"
    puts "Phone:     #{person.phone_number}"
    puts "Slack:     #{person.slack_account}"
    puts "Github:    #{person.github_account}"
    puts
  end

  def print_report
    # ------------------------------------------------------------------------------------------------
    # | name  | phone    | address         | position        | salary  | slack        | github       |
    # ------------------------------------------------------------------------------------------------
    # | Gavin | 555-1212 | 1 Main Street   | Instructor      | 1000000 | gstark       | gstark       |
    # | Jason | 555-4242 | 500 Elm Street  | Instructor      | 2000000 | ambethia     | ambethia     |
    # | Toni  | 555-4444 | 200 Pine Street | Campus Director | 3000000 | amazing_toni | amazing_toni |
    # ------------------------------------------------------------------------------------------------

    longest_name_length     = ["name".length,     @people.map { |person| person.name.length }.max].max
    longest_phone_length    = ["phone".length,    @people.map { |person| person.phone_number.length }.max].max
    longest_address_length  = ["address".length,  @people.map { |person| person.address.length }.max].max
    longest_position_length = ["position".length, @people.map { |person| person.position.length }.max].max
    longest_salary_length   = ["salary".length,   @people.map { |person| person.salary.length }.max].max
    longest_slack_length    = ["slack".length,    @people.map { |person| person.slack_account.length }.max].max
    longest_github_length   = ["github".length,   @people.map { |person| person.github_account.length }.max].max

    length_of_separator = (longest_name_length +
               longest_phone_length +
               longest_slack_length +
               longest_salary_length +
               longest_github_length +
               longest_address_length +
               longest_position_length +
               7 * 3 +
               1)

    puts "-" * length_of_separator
    puts "| #{"name".ljust(longest_name_length)} | #{"phone".ljust(longest_phone_length)} | #{"address".ljust(longest_address_length)} | #{"position".ljust(longest_position_length)} | #{"salary".ljust(longest_salary_length)} | #{"slack".ljust(longest_slack_length)} | #{"github".ljust(longest_github_length)} |"
    puts "-" * length_of_separator
    @people.each do |person|
      puts "| #{person.name.ljust(longest_name_length)} | #{person.phone_number.ljust(longest_phone_length)} | #{person.address.ljust(longest_address_length)} | #{person.position.ljust(longest_position_length)} | #{person.salary.ljust(longest_salary_length)} | #{person.slack_account.ljust(longest_slack_length)} | #{person.github_account.ljust(longest_github_length)} |"
    end
    puts "-" * length_of_separator
  end

  def show_menu
    loop do
      puts "What do you want to do?"
      puts
      puts "(A)dd a person"
      puts "(S)earch for a person"
      puts "(D)elete a person"
      puts "(R)eport"
      puts
      puts "Action: "
      answer = gets.chomp

      case answer
      when "A"
        add_person
      when "S"
        search_person
      when "D"
        delete_person
      when "R"
        print_report
      else
        puts "Unknown option"
      end
    end
  end
end

my_database = Database.new
my_database.show_menu
