class Player
  attr_accessor :name, :date_of_birth, :height
  attr_reader :db

  def initialize(id, name, date_of_birth, height, db)
    @db = db
  end

  def self.save(name, date_of_birth, db)
    db.execute("INSERT INTO yankees_1920 (name, date_of_birth) VALUES (?, ?)", name, date_of_birth)
  end

  def self.find(id, db)
    player = db.execute("SELECT * FROM yankees_1920 WHERE id = #{id}")
    Player.new(id:player.flatten[0], name:player.flatten[1], date_of_birth:player.flatten[2], db:db)
  end

  def alter_name(newname, db)
    self.db.execute("UPDATE yankees_1920 SET name = #{name} WHERE id = #{self.id}")
  end

  def name
    self.db.execute("SELECT name FROM yankees_1920 WHERE id = #{self.id}").flatten[0]
  end

end
