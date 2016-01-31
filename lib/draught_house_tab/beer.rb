class Beer
  attr_accessor :name, :brewery, :beer_style, :abv, :listed_on, :profile_url, :description

  @@all = []

  def initialize(beer_hash={})
    beer_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.each do |beer|
      if beer.name==name
        return beer
      end
    end
  end

end
