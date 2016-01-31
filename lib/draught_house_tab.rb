require_relative "./draught_house_tab/tab_list_scraper.rb"
require_relative "./draught_house_tab/beer.rb"

class DraughtHouseTab
  def run
    puts "Hi, below is a list of current beers on tap at Draught House. "
    beers =TabListScraper.scrape_index_page
    beers.each do |beer|
      Beer.new(beer)
      beer.values.each do |value|
        puts value
      end
      puts ""
      puts ""
    end

    quit=false
    while !quit
      puts "To view detailed descriptions for a beer, please enter the full name of beer."
      beer_name= gets.chomp
      beer = Beer.find_by_name(beer_name)
      if beer != nil
        TabListScraper.scrape_profile_page(beer)

        #  attr_accessor :name, :brewery, :beer_style, :abv, :listed_on, :profile_url, :description
        puts beer.brewery
        puts beer.beer_style
        puts beer.abv
        puts beer.description
        puts "View another beer? Y/N"
        answer = gets.chomp
        if answer == "N"
          quit=true
        end
      end
    end
  end
end
