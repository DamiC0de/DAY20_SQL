require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/chinook.db')

# Recherchez l'ID de l'album "Let There Be Rock"
album_id = db.get_first_value("SELECT AlbumId FROM albums WHERE Title = ?", ['Let There Be Rock'])

if album_id
  # Récupérez et affichez les titres des morceaux de l'album "Let There Be Rock"
  puts "Titres de l'album 'Let There Be Rock' :"
  db.execute("SELECT Name FROM tracks WHERE AlbumId = ?", [album_id]) do |row|
    puts "Title: #{row[0]}"
  end
else
  puts "Aucun album nommé 'Let There Be Rock' n'a été trouvé dans la base de données."
end

# Fermez la connexion à la base de données
db.close
