require 'sqlite3'

# Étape 1: Créez une connexion à la base de données
db = SQLite3::Database.new('./db/moocademy_cours_en_ligne.db')

# Étape 2: Créez la table "cours"
db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS cours (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    description TEXT
  );
SQL

# Étape 3: Créez la table "lecons"
db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS lecons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    body TEXT,
    cours_id INTEGER,
    FOREIGN KEY (cours_id) REFERENCES cours (id)
  );
SQL

# Fermez la connexion à la base de données
db.close
