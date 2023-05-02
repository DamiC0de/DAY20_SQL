require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/chinook.db')

# Supprimez les albums dont le titre contient "music"
db.execute("DELETE FROM albums WHERE Title LIKE ?", ['%music%'])

# Validez les changements et fermez la connexion à la base de données
db.commit
db.close
