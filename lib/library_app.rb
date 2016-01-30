require_relative "./library_app/austin_library_scraper.rb"

class LibraryApp
  def run
    puts "Please enter a zipcode to get a list of Austin public libraries. "
    zipcode = gets.chomp
    scraper = AustinLibraryScraper.new(zipcode)

  end


end
