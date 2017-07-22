require_relative "environment"

Scraper.new(@db).scrape

all_yankees = @db.execute("SELECT * FROM yankees_1920;")
binding.pry

