require 'nokogiri'
require 'open-uri'
require 'pry'

class TapListScraper

  def self.scrape_index_page
    url="http://www.taplister.com/bars/40b13b00f964a5209af31ee3"
    doc = Nokogiri::HTML(open(url))
    beers_hash = []

    doc.css("div.row.bottom-padding div.zebra.round.result.bottom-padding").each do |beer_info|
      beer_hash = {
        :brewery => beer_info.css("div.row div.twelve.columns.phone-four h4")[0].text,
        :name => beer_info.css("div.row div.nine.columns.phone-three.beer-item-name a").text.strip,
        :abv => beer_info.css("div.row div.twelve.columns ul.block-grid.three-up li h4").text,
        :listed_on => beer_info.css("div.row div.row div.twelve.columns sub.listed-on").text,
        :profile_url => "http://www.taplister.com#{beer_info.css("div.row div.nine.columns.phone-three.beer-item-name a").attribute("href").value}"
      }
      beers_hash << beer_hash
    end

    beers_hash
  end

  def self.scrape_profile_page(beer)
    doc = Nokogiri::HTML(open(beer.profile_url))

    text = text = doc.css("div.row.bottom-padding").text
    array = text.split(/\s{3,}/)
    beer.beer_style = array[3]
    beer.description = array[4]
    beer
  end

end

#todo: make spec based on those pages
# beer=Beer.new
#
# beer.profile_url="https://www.taplister.com/beers/512-pecan-porter/58364/"
#
# TabListScraper.scrape_profile_page(beer)
