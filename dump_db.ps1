# Lancer la commande : .\dump_db.ps1 pour créer un dump de la base de données

# Paramètres de connexion à la base de données
$DB_HOST = "127.0.0.1"
$DB_PORT = "3306"
$DB_NAME = "click-n-party"
$DB_USER = "root"
$DB_PASSWORD = ""

# Dossier de destination pour le dump
$DUMP_DIR = ".\dump"

# Nom du fichier dump
$DUMP_FILE = "$DUMP_DIR\$DB_NAME.sql"

Write-Host "Création du dump dans $DUMP_FILE..."

# Création du dump
& 'C:\wamp64\bin\mysql\mysql8.2.0\bin\mysqldump.exe' -h $DB_HOST -P $DB_PORT -u $DB_USER -p $DB_PASSWORD $DB_NAME | Out-File -FilePath $DUMP_FILE

if ($?) {
    Write-Host "Dump créé avec succès."
} else {
    Write-Host "Erreur lors de la création du dump."
}