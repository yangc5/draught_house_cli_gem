require_relative "./spec_helper"
require 'pry'

describe "TabListScraper" do

  let!(:beer_index_array) {[
     {:brewery=>"Victory Brewing Company",
      :name=>"Victory Hop Ranch Imperial India Pale Ale",
      :abv=>"ABV: 9%",
      :listed_on=>"Listed on Jan 05, 2016",
      :profile_url=>
       "http://www.taplister.com/beers/victory-hop-ranch-imperial-india-pale-ale/217987/"},
     {:brewery=>"Victory Brewing Company",
      :name=>"Victory Moving Parts IPA - Batch 05",
      :abv=>"ABV: 6.5%",
      :listed_on=>"Listed on Jan 26, 2016",
      :profile_url=>
       "http://www.taplister.com/beers/victory-moving-parts-ipa-batch-05/355329/"},
     {:brewery=>"Zilker Brewing Company",
      :name=>"Zilker Session IPA",
      :abv=>"ABV: 5.5%",
      :listed_on=>"Listed on Jan 28, 2016",
      :profile_url=>"http://www.taplister.com/beers/zilker-session-ipa/339764/"}
    ]}

  let!(:zilker_session_ipa) {{
    beer_style: 'Session IPA',
    description: 'Light, crisp, and hop forward, this tweener ale has the drinkability of a pale ale and the hoppy punch of an IPA. A simple malt bill anchored by organic pilsner allows the house yeast and American hops to shine through, producing the piney and citrusy flavor and aroma you expect from an American IPA, and of course it’s dry hopped.'
    }}

  describe '#scrape_index_page' do
    it "is a class method that scrapes the beer index page and returns an array of hashes in which each hash represents one beer" do
      scraped_beers = TapListScraper.scrape_index_page
      expect(scraped_beers).to be_a(Array)
      expect(scraped_beers.first).to include(:brewery, :name, :abv, :listed_on, :profile_url)
      # expect(scraped_beers).to match(beer_index_array)
    end
  end

  describe "#scrape_profile_page" do
    context "after scraping a completed beer profile page" do
      it "returns a hash of attributes that describes a beer" do
        beer = Beer.new({ brewery: 'Zilker Brewing Company',
                          name: 'Zilker Session IPA',
                          abv: 'ABV: 5.5%',
                          listed_on: 'Listed on Jan 28, 2016',
                          profile_url: 'http://www.taplister.com/beers/zilker-session-ipa/339764/'})
        scraped_beer = TapListScraper.scrape_profile_page(beer)
        expect(scraped_beer.beer_style).to include('Session IPA')
        expect(scraped_beer.description).to include('Light, crisp, and hop forward, this tweener ale has the drinkability of a pale ale and the hoppy punch of an IPA. A simple malt bill anchored by organic pilsner allows the house yeast and American hops to shine through, producing the piney and citrusy flavor and aroma you expect from an American IPA, and of course it’s dry hopped.')
      end
    end
  end
end
