Gem::Specification.new do |s|
  s.name        = 'draught_house_tap'
  s.version     = '0.0.0'
  s.executable << 'run'
  s.date        = '2016-02-02'
  s.summary     = "Draught House tap beer list cli app gem"
  s.description = "The app scrapes a list of beer currently available at a local Austin beer bar named Draught House from taplister.com and displays basic information for each beer, i.e. name, brewery, abv, etc."
  s.authors     = ["Chen Yang"]
  s.email       = 'chennysuperawesome@gmail.com'
  s.files       = ["lib/draught_house_tap.rb", "lib/draught_house_tap/beer.rb", "lib/draught_house_tap/tap_list_scraper.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
end
