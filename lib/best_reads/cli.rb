class BestReads::CLI
  def call
    intro_menu
    options_menu
  end
  def intro_menu
    puts "Welcome to Best Reads!"
    puts "Here is a list of the best books of May, 2017"
    Scraper.scrape_books_this_month
  end
  def options_menu
    puts "Please select one of our Best-Of Lists"
    puts "1 - Best Books ever"
    puts "2 - Best Books by year"
    puts "exit to quit"
    user_input = ""
    while user_input != "exit"
      user_input = gets.strip.downcase
      puts "user_input: #{user_input}"
      case user_input.to_s
      when "1"
        Scraper.scrape_best_books_ever
      when "2"
        Scraper.scrape_best_books_by_year
      else
        puts "Please enter 1,2 or exit"
      end
    end
  end
  def details_menu
  end
end
