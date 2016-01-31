require_relative "./spec_helper"
require "pry"

describe "Beer" do
  let!(:beer_index_array) {[
    {brewery: "def brewerying co", name: "def best beer", abv: "ABV: 7%", listed_on: "Listed On: Jan 28, 2016", profile_url: "http://www.taplister.com/beers/def_best_beer"},
    {brewery: "ghi brewerying co", name: "ghi best beer", abv: "ABV: 5%", listed_on: "Listed On: Jan 27, 2016", profile_url: "http://www.taplister.com/beers/ghi_best_beer"},
    {brewery: "xyz brewerying co", name: "xyz best beer", abv: "ABV: 8%", listed_on: "Listed On: Jan 30, 2016", profile_url: "http://www.taplister.com/beers/xyz_best_beer"}
    ]}

  let!(:beer_details) {{
    beer_style: "style: IPA",
    description: "Light, crisp, and hop forward, this tweener ale has the drinkability of a pale ale and the hoppy punch of an IPA. A simple malt bill anchored by organic pilsner allows the house yeast and American hops to shine through, producing the piney and citrusy flavor and aroma you expect from an American IPA, and of course it’s dry hopped."
    }}

  let!(:beer) {Beer.new({brewery: "abc brewerying co", name: "abc best beer", abv: "ABV: 6%", listed_on: "Listed On: Jan 29, 2016", profile_url: "http://www.taplister.com/beers/abc_best_beer"})}

  after(:each) do
    Beer.class_variable_set(:@@all, [])
  end
  describe "#new" do
    it "takes in an argument of a hash and sets the new beer's attributes using the key/value pairs of that hash." do
      expect{Beer.new({brewery: "def brewerying co", name: "def best beer", abv: "ABV: 7%", listed_on: "Listed On: Jan 28, 2016", profile_url: "http://www.taplister.com/beers/def_best_beer"})}.to_not raise_error
      expect(beer.brewery).to eq("abc brewerying co")
      expect(beer.name).to eq("abc best beer")
      expect(beer.abv).to eq("ABV: 6%")
      expect(beer.listed_on).to eq("Listed On: Jan 29, 2016")
      expect(beer.profile_url).to eq("http://www.taplister.com/beers/abc_best_beer")
    end

    it "adds that new beer to the Beer class' collection of all existing beers, stored in the `@@all` class variable." do
      expect(Beer.class_variable_get(:@@all).first.name).to eq("abc best beer")
    end
  end

  describe "#all" do
    it "returns all beer instances within Beer class' collection stored in the `@@all` class variable." do
      beer_index_array.each do |beer_hash|
        Beer.new(beer_hash)
      end
      expect(Beer.all.count).to eq(4)
      expect(Beer.all.last.name).to eq("xyz best beer")
    end
  end

  describe "#find_by_name" do
    it "returns the beer instance which matches the name argument passed in." do
      beer_index_array.each do |beer_hash|
        Beer.new(beer_hash)
      end
      expect(Beer.find_by_name("ghi best beer")).to eq(Beer.all[2])
    end
  end

end
