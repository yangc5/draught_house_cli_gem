class Library
  attr_accessor :name, :address, :telephone, :distance_from_zip, :closed_days, :hours

  @@all = []

  def initialize(library_hash)
    library_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end


end
