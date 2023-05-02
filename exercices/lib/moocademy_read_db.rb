require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/moocademy_cours_en_ligne.db')

# Récupérez et affichez les données de la table "cours"
puts "Cours:"
db.execute("SELECT * FROM cours") do |row|
  puts "ID: #{row[0]}, Titre: #{row[1]}, Description: #{row[2]}"
end

# Récupérez et affichez les données de la table "lecons"
puts "\nLeçons:"
db.execute("SELECT * FROM lecons") do |row|
  puts "ID: #{row[0]}, Titre: #{row[1]}, Body: #{row[2]}, Cours ID: #{row[3]}"
end

# Fermez la connexion à la base de données
db.close
