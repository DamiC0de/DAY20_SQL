require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/chinook.db')

# Récupérez et affichez les données de la table "albums"
puts "Albums:"
db.execute("SELECT * FROM albums") do |row|
  puts "AlbumId: #{row[0]}, Title: #{row[1]}, ArtistId: #{row[2]}"
end

# Fermez la connexion à la base de données
db.close
