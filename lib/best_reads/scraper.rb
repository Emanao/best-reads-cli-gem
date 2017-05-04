class BestReads::Scraper
  def self.scrape_books_this_month
    index_url = "https://www.goodreads.com/list/best_of_month/2017/May?id=108656.Best_books_of_May_2017"
    doc = Nokogiri::HTML(open(index_url))

  end

  def self.scrape_best_books_ever
    puts "Here is the list for the Best Books ever"
    index_url = "https://www.goodreads.com/list/show/1"
    doc = Nokogiri::HTML(open(index_url))
  end
  def self.scrape_best_books_by_year
    puts "Here is a list for the Best Books by year"
    index_url = "https://www.goodreads.com/list/best_of_year/2017?id=107026.Best_Books_of_2017"
    doc = Nokogiri::HTML(open(index_url))
  end
end
