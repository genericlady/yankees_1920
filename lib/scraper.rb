class Scraper
  URL = "http://www.baseball-almanac.com/teamstats/roster.php?y=1920&t=NYA"
  attr_accessor :file, :parsed_file, :all_players, :db

  def initialize(db)
    self.db = db
    self.parsed_file = Nokogiri::HTML(open(URL))
    self.all_players = scrape_all_players
  end

  def scrape_all_players
    self.all_players = parsed_file.css(".boxed").css("tr")[2..-1]
  end

  def get_player_name_from(node)
    unless node.css("td")[1].nil?
      node.css("td")[1].text
    end
  end

  def get_player_date_of_birth_from(node)
    unless node.css("td")[1].nil?
      node.css("td")[-1].text
    end
  end

  def scrape
    all_players.each do |player_node|
      player_name = get_player_name_from(player_node)
      player_date_of_birth = get_player_date_of_birth_from(player_node)
      unless player_name.nil? || player_date_of_birth.nil?
        Player.save(player_name, player_date_of_birth, db)
      end
    end
  end

end

