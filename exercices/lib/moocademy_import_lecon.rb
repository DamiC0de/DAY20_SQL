require 'sqlite3'

# Ouvrez la connexion à la base de données
db = SQLite3::Database.new('./db/moocademy_cours_en_ligne.db')

# Insérez un cours
cours_titre = "Introduction à Python"
cours_description = "Apprenez les bases de la programmation Python."
db.execute("INSERT INTO cours (titre, description) VALUES (?, ?)", [cours_titre, cours_description])

# Récupérez l'ID du cours inséré
cours_id = db.last_insert_row_id

# Insérez la leçon avec le titre et le body donnés
lecon_titre = "Python"
lecon_body = "Apprendre le python facilement"
db.execute("INSERT INTO lecons (titre, body, cours_id) VALUES (?, ?, ?)", [lecon_titre, lecon_body, cours_id])

# Fermez la connexion à la base de données
db.close

