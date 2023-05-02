require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/chinook.db')

# Récupérez le nombre total d'albums
count = db.get_first_value("SELECT COUNT(*) FROM albums")

puts "Nombre total d'albums : #{count}"

# Fermez la connexion à la base de données
db.close
