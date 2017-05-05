class BestReads::CLI

  def call
    lists_menu
  end
  def lists_menu
    puts "Welcome to Best Reads!"
    puts "Please choose one of our Best-Of Lists"

    #Scraping best of lists of books, printing them and initializing list objects
    best_of_lists = BestReads::Scraper.scrape_best_of_lists
    best_of_lists.each_with_index do |list, index|
      puts "#{index+1}. #{list[:name].to_s}"
      BestReads::List.new(list)
    end
    puts "exit to quit"

    user_input = ""
    while user_input != "exit"
      user_input = gets.strip
      if(user_input.to_i.between?(1,best_of_lists.size))
        books_by_list_menu(user_input)
      else
        puts "Please enter a number between 1 and #{best_of_lists.size} or exit to quit"
      end
    end
  end

  def books_by_list_menu(user_input)
    list_url = BestReads::List.find_by_index(user_input).url
    puts "user_input:#{user_input} #{list_url}"
    best_of_books = BestReads::Scraper.scrape_books_by_list(list_url.to_s)
    best_of_books.each_with_index do |book, index|
      puts "#{index+1}. #{book[:title].to_s} by #{book[:author].to_s}"
      puts "rating: #{book[:rating]}"
      BestReads::Book.new(book)
    end
  end
  def details_menu
  end
end
