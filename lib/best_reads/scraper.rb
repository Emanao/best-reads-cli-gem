require "pry"
class BestReads::Scraper
  def self.scrape_best_of_lists
    index_url = "https://www.goodreads.com/list"
    doc = Nokogiri::HTML(open(index_url))
    details_lists = []
    parser_lists = doc.css(".rightContainer .bigBoxContent").first.css("a.listTitle")
    parser_lists.each do |parser_list|
      details_lists << {name: parser_list.text, url: parser_list["href"]}
    end
    details_lists
  end
  def self.scrape_books_by_list(list_url)
    #list_url_1 = 'https://www.goodreads.com/list/show/1.Best_Books_Ever'
    #binding.pry
    doc = Nokogiri::HTML(open(list_url))
    page_title = doc.css(".mainContentContainer .listPageTitle")
    book_title = doc.css("#all_votes a.bookTitle span")
    #puts "Nokogiri: #{doc}"
    puts "Nokogiri 1: #{page_title.text}"
    puts "Nokogiri 2: #{book_title.text}"



  end

end
