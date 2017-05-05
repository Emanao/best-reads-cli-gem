require "pry"
class BestReads::Scraper
  def self.scrape_best_of_lists
    index_url = "https://www.goodreads.com/list"
    doc = Nokogiri::HTML(open(index_url))
    list_details = []
    lists = doc.css(".rightContainer .bigBoxContent").first.css("a.listTitle")
    lists.each do |list|
      list_details << {name: list.text, url: list["href"]}
    end
    list_details
  end
  def self.scrape_books_by_list(list_url)
    doc = Nokogiri::HTML(open(list_url))
    book_details = []
    page_title = doc.css(".mainContentContainer .listPageTitle")
    puts "Nokogiri 1: #{page_title.text}"

    book_table = doc.css("#all_votes tr td[3]")
    book_table.each do |book_detail|
      book_details << {title: book_detail.css("a.bookTitle span").text, author: book_detail.css("a.authorName").text}
    end
    book_details

  end

end
