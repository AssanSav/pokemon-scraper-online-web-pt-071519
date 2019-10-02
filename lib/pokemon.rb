class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end
  
  def self.find(uniq_id, db) 
    r = db.execute("SELECT * FROM pokemon WHERE id = ?", uniq_id).first 
    pokemon = Pokemon.new(id: r[0], name: r[1],type: r[2], db: db)
  end
end
