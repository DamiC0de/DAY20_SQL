require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/chinook.db')

# Récupérez la liste des tables
tables = db.execute("SELECT name FROM sqlite_master WHERE type='table'")

# Parcourez chaque table et affichez ses colonnes
tables.each do |table|
  table_name = table[0]
  puts "\nTable: #{table_name}"

  # Récupérez les informations sur les colonnes de la table
  columns = db.execute("PRAGMA table_info(#{table_name})")
  
  # Affichez les informations sur les colonnes
  columns.each do |col|
    puts "  Colonne: #{col[1]}, Type: #{col[2]}"
  end
end

# Fermez la connexion à la base de données
db.close
