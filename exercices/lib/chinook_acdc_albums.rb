require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/chinook.db')

# Recherchez l'ID de l'artiste AC/DC
artist_id = db.get_first_value("SELECT ArtistId FROM artists WHERE Name = ?", ['AC/DC'])

if artist_id
  # Récupérez et affichez les albums écrits par AC/DC
  puts "Albums écrits par AC/DC:"
  db.execute("SELECT * FROM albums WHERE ArtistId = ?", [artist_id]) do |row|
    puts "AlbumId: #{row[0]}, Title: #{row[1]}, ArtistId: #{row[2]}"
  end
else
  puts "Aucun artiste nommé 'AC/DC' n'a été trouvé dans la base de données."
end

# Fermez la connexion à la base de données
db.close
