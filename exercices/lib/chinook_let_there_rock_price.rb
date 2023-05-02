require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/chinook.db')

# Recherchez l'ID de l'album "Let There Be Rock"
album_id = db.get_first_value("SELECT AlbumId FROM albums WHERE Title = ?", ['Let There Be Rock'])

if album_id
  # Récupérez et affichez le prix total et la durée totale des morceaux de l'album "Let There Be Rock"
  price_and_duration = db.execute("SELECT SUM(UnitPrice), SUM(Milliseconds) FROM tracks WHERE AlbumId = ?", [album_id]).first
  total_price = price_and_duration[0]
  total_duration_ms = price_and_duration[1]
  total_duration_min = total_duration_ms / 60000.0

  puts "Prix total de l'album 'Let There Be Rock' : $#{total_price}"
  puts "Durée totale de l'album 'Let There Be Rock' : #{total_duration_min.round(2)} minutes"
else
  puts "Aucun album nommé 'Let There Be Rock' n'a été trouvé dans la base de données."
end

# Fermez la connexion à la base de données
db.close
