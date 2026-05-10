# Database - Cold Room Monitoring

Ce dossier contient les schémas SQL, les migrations versionnées et la documentation de la base de données PostgreSQL du projet.

## Prérequis

- PostgreSQL 14+
- Accès à un utilisateur `postgres` (superutilisateur) pour la création initiale

## Structure

```
database/
├── schemas/        # Schémas SQL initiaux (tables, index, données de test)
├── migrations/     # Scripts de migration versionnés (UP/DOWN)
└── README.md       # Ce fichier
```

## Configuration initiale

### 1. Installer PostgreSQL

**Ubuntu/Debian:**
```bash
sudo apt update && sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
```

**macOS (Homebrew):**
```bash
brew install postgresql@14
brew services start postgresql@14
```

**Windows:**
Télécharger l'installeur depuis https://www.postgresql.org/download/windows/

### 2. Créer la base de données et l'utilisateur

Utiliser le script fourni (depuis la racine du projet) :

```bash
bash scripts/init_db.sh
```

Ce script :
- Crée l'utilisateur PostgreSQL défini dans `.env`
- Crée la base de données `cold_room_dev`
- Accorde les privilèges nécessaires
- Exécute les migrations Django (`python manage.py migrate`)

### 3. Configuration manuelle (alternative)

Si vous préférez configurer manuellement :

```sql
-- Se connecter en tant que superutilisateur
psql -U postgres

-- Créer l'utilisateur
CREATE USER cold_room_user WITH PASSWORD 'votre_mot_de_passe';

-- Créer la base de données
CREATE DATABASE cold_room_dev OWNER cold_room_user;

-- Accorder les privilèges
GRANT ALL PRIVILEGES ON DATABASE cold_room_dev TO cold_room_user;
```

### 4. Variables d'environnement

Copier `backend/.env.example` vers `backend/.env` et renseigner :

```env
DB_NAME=cold_room_dev
DB_USER=cold_room_user
DB_PASSWORD=votre_mot_de_passe
DB_HOST=localhost
DB_PORT=5432
```

### 5. Vérifier la connexion

```bash
cd backend
python manage.py migrate
```

Si les migrations s'exécutent sans erreur, la connexion est établie.

## Schémas SQL

Les schémas SQL purs (indépendants de Django ORM) se trouvent dans `schemas/` :

| Fichier | Description |
|---------|-------------|
| `001_initial_schema.sql` | Tables principales : `sensors`, `sensor_readings`, `alerts` |
| `002_seed_data.sql` | Données de test : 4 capteurs initiaux |
| `003_indexes.sql` | Index pour optimisation des requêtes |

> Ces fichiers sont créés dans **TASK-101**. Ils servent de référence SQL et de documentation du schéma.

## Migrations versionnées

Les migrations manuelles se trouvent dans `migrations/` et suivent la convention :

```
NNN_description_courte.sql
```

Chaque fichier contient des sections `-- UP` et `-- DOWN` pour appliquer ou annuler la migration.

> Le processus de migration est documenté dans `migrations/README.md` (créé dans **TASK-102**).

## Modèle de données

```
sensors
  ├── id (PK)
  ├── name, sensor_type, unit, location
  ├── min_threshold, max_threshold
  ├── is_active
  └── created_at, updated_at

sensor_readings
  ├── id (PK)
  ├── sensor_id (FK → sensors, CASCADE)
  ├── value
  └── timestamp

alerts
  ├── id (PK)
  ├── sensor_id (FK → sensors)
  ├── reading_id (FK → sensor_readings)
  ├── alert_type, severity, message
  ├── is_resolved
  └── created_at, resolved_at
```

## Dépannage

**Erreur `FATAL: password authentication failed`**  
→ Vérifier `DB_USER` et `DB_PASSWORD` dans `.env`

**Erreur `FATAL: database "cold_room_dev" does not exist`**  
→ Relancer `bash scripts/init_db.sh`

**Erreur `could not connect to server`**  
→ Vérifier que PostgreSQL est démarré : `sudo systemctl status postgresql`
