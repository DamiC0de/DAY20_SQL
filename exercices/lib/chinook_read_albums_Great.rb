require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/chinook.db')

# Récupérez et affichez les données de la table "albums" dont le titre contient "Great"
puts "Albums contenant 'Great' :"
db.execute("SELECT * FROM albums WHERE Title LIKE ?", ['%Great%']) do |row|
  puts "AlbumId: #{row[0]}, Title: #{row[1]}, ArtistId: #{row[2]}"
end

# Fermez la connexion à la base de données
db.close
