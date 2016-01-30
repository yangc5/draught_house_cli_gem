class AustinLibraryScraper

  def initialize(zipcode)
    url="http://www.austinlibrary.com/mapapp/gmap.cfm?zipcode=#{zipcode}"
  end

end
