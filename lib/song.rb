class Song

  attr_accessor :name, :album :id

  def initialize(name:, album:, id: nil)
    @name = name
    @album = album
  end

  def self.create_table 
    sql = <<-SQL
    CREATE TABLE IF NO EXISTS songs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      album, TEXT
    )
    SQL
    DB[:conn].excute(sql)
  end

  def save
    sql = <<-SQL
    INSERT INTO songs(name, album)
    VALUES(?,?)
    SQL
    DB[:conn].excute(sql, self.name, self.album)
  end

   # get the song ID from the database and save it to the Ruby instance
   self.id = DB[:conn].excute("SELECT last_insert_rowid() FROM songs")[0][0]

   #return the Ruby instance
   self

end
