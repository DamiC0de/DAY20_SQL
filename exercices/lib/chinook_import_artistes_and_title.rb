require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('chinook.db')

# Insérez l'artiste "Guns and Roses" dans la table "artists"
db.execute("INSERT INTO artists (Name) VALUES (?)", ['Guns and Roses'])
artist_id = db.last_insert_row_id

# Insérez l'album "Appetite for Destruction" dans la table "albums"
db.execute("INSERT INTO albums (Title, ArtistId) VALUES (?, ?)", ['Appetite for Destruction', artist_id])
album_id = db.last_insert_row_id

# Insérez les morceaux "Paradise City" et "Sweet Child o Mine" dans la table "tracks"
tracks = [
  {name: 'Paradise City', unit_price: 0.99, milliseconds: 240000},
  {name: 'Sweet Child o Mine', unit_price: 0.99, milliseconds: 230000}
]

media_type_id = 1

tracks.each do |track|
  db.execute("INSERT INTO tracks (Name, AlbumId, MediaTypeId, UnitPrice, Milliseconds) VALUES (?, ?, ?, ?, ?)",
             [track[:name], album_id, media_type_id, track[:unit_price], track[:milliseconds]])
end

# Validez les changements et fermez la connexion à la base de données
db.close

puts "L'artiste, l'album et les morceaux ont été ajoutés à la base de données."
