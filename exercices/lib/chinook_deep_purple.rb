require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/chinook.db')

# Recherchez l'ID de l'artiste "Deep Purple"
artist_id = db.get_first_value("SELECT ArtistId FROM artists WHERE Name = ?", ['Deep Purple'])

if artist_id
  # Récupérez les ID des albums de "Deep Purple"
  album_ids = db.execute("SELECT AlbumId FROM albums WHERE ArtistId = ?", [artist_id]).flatten

  if album_ids.any?
    # Calculez le coût total de la discographie de "Deep Purple"
    total_cost = db.get_first_value("SELECT SUM(UnitPrice) FROM tracks WHERE AlbumId IN (#{album_ids.join(', ')})")

    puts "Coût de l'intégralité de la discographie de 'Deep Purple' : $#{total_cost}"
  else
    puts "Aucun album de 'Deep Purple' n'a été trouvé dans la base de données."
  end
else
  puts "Aucun artiste nommé 'Deep Purple' n'a été trouvé dans la base de données."
end

# Fermez la connexion à la base de données
db.close
