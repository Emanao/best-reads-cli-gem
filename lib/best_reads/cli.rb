class BestReads::CLI
  def call
    intro_menu
    #options_menu
  end
  def intro_menu
    puts "Welcome to Best Reads!"
    puts "Please choose one of our Best-Of Lists"

    best_of_lists =BestReads::Scraper.scrape_best_of_lists
    best_of_lists.each_with_index do |list, index|
      puts "#{index+1}. #{list}"
      BestReads::List.new(list)
    end
    puts "exit to quit"
    user_input = ""
    while user_input != "exit"
      user_input = gets.strip.downcase
      puts "user_input: #{user_input}"
      case user_input.to_s
      when "1"
        BestReads::Scraper.scrape_best_books_ever
      when "2"
        BestReads::Scraper.scrape_best_books_by_year
      else
        puts "Please enter 1,2 or exit"
      end
    end
  end

  def options_menu
  end
  def details_menu
  end
end
