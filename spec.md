# 🌡️ Système de Surveillance IoT - Chambre Froide

## Vue d'ensemble

Système de surveillance en temps réel pour chambre froide avec détection d'anomalies, alertes automatiques et interface web de monitoring.

## Stack Technique

- **Frontend**: HTML5 / CSS3 / JavaScript (Vanilla + Chart.js)
- **Backend**: Django 4.2+ (Python 3.9+)
- **Base de données**: PostgreSQL (SQL pur)
- **Communication**: API REST + Django Channels (WebSocket)
- **Simulation**: Script Python autonome

## Architecture

```
iot-cold-room-monitoring/
├── backend/           # Projet Django
├── frontend/          # Fichiers statiques HTML/CSS/JS
├── database/          # Schémas et migrations SQL
├── simulator/         # Script de simulation IoT
├── scripts/           # Utilitaires de lancement
└── docs/              # Documentation technique
```

---

## 📊 Tableau de Suivi Global

| Phase | Task ID | Titre | Responsable | Branche | Statut |
|-------|---------|-------|-------------|---------|--------|
| 0 | TASK-001 | Initialisation Repo | @dev1 | feature/TASK-001-init-repo | ✅ DONE |
| 0 | TASK-002 | Structure Django de base | @dev2 | feature/TASK-002-django-scaffold | ✅ DONE |
| 0 | TASK-003 | Configuration PostgreSQL locale | @dev3 | feature/TASK-003-postgres-config | ✅ DONE |
| 1 | TASK-101 | Schéma SQL complet | @db-dev | feature/TASK-101-sql-schema | ⬜ TODO |
| 1 | TASK-102 | Scripts de migration SQL | @db-dev | feature/TASK-102-sql-migrations | ⬜ TODO |
| 2 | TASK-201 | Modèles Django ORM | @backend1 | feature/TASK-201-django-models | ⬜ TODO |
| 2 | TASK-202 | Configuration Django settings | @backend2 | feature/TASK-202-django-settings | ⬜ TODO |
| 2 | TASK-203 | Système d'authentification | @backend2 | feature/TASK-203-auth-system | ⬜ TODO |
| 3 | TASK-301 | Serializers DRF | @backend1 | feature/TASK-301-serializers | ⬜ TODO |
| 3 | TASK-302 | API Sensors CRUD | @backend3 | feature/TASK-302-api-sensors | ⬜ TODO |
| 3 | TASK-303 | API Readings & History | @backend3 | feature/TASK-303-api-readings | ⬜ TODO |
| 3 | TASK-304 | API Alerts Management | @backend1 | feature/TASK-304-api-alerts | ⬜ TODO |
| 4 | TASK-401 | Structure HTML de base | @frontend1 | feature/TASK-401-html-scaffold | ⬜ TODO |
| 4 | TASK-402 | CSS Global & Variables | @frontend2 | feature/TASK-402-css-global | ⬜ TODO |
| 4 | TASK-403 | Page Dashboard - Layout | @frontend1 | feature/TASK-403-dashboard-layout | ⬜ TODO |
| 4 | TASK-404 | Page Dashboard - Cartes Capteurs | @frontend3 | feature/TASK-404-sensor-cards | ⬜ TODO |
| 4 | TASK-405 | Page Dashboard - Graphiques | @frontend3 | feature/TASK-405-charts-impl | ⬜ TODO |
| 4 | TASK-406 | Page Alerts - Liste & Filtres | @frontend2 | feature/TASK-406-alerts-page | ⬜ TODO |
| 4 | TASK-407 | Page Settings - Configuration | @frontend1 | feature/TASK-407-settings-page | ⬜ TODO |
| 5 | TASK-501 | Service API JavaScript | @frontend3 | feature/TASK-501-api-service | ⬜ TODO |
| 5 | TASK-502 | WebSocket temps réel | @backend3 | feature/TASK-502-websocket | ⬜ TODO |
| 5 | TASK-503 | Détection anomalies backend | @backend1 | feature/TASK-503-anomaly-detection | ⬜ TODO |
| 5 | TASK-504 | Simulateur IoT Python (REST) | @sim-dev | feature/TASK-504-iot-simulator | ⬜ TODO |
| 6 | TASK-601 | Tests unitaires backend | @qa1 | feature/TASK-601-backend-tests | ⬜ TODO |
| 6 | TASK-602 | Tests frontend manuels | @qa2 | feature/TASK-602-frontend-tests | ⬜ TODO |
| 6 | TASK-603 | Documentation finale | @tech-writer | feature/TASK-603-docs-final | ⬜ TODO |

**Légende des statuts:**
- ⬜ TODO - Pas encore commencé
- 🔄 IN PROGRESS - En cours de développement
- ✅ DONE - Terminé et mergé

**Workflow:**
1. Choisir une tâche disponible (dépendances satisfaites)
2. Créer la branche correspondante
3. Développer et tester
4. Push vers GitHub
5. Créer une Pull Request
6. Après merge, changer le statut à ✅ DONE

---

## 📋 Phase 0 : Initialisation du Projet

### TASK-001 : Initialisation du Repository Git
**Responsable**: @dev1  
**Branche**: feature/TASK-001-init-repo  
**Dépendances**: Aucune

**Objectif**: Mettre en place le repository distant et l'arborescence de base du projet.

**Critères d'acceptation**:
- [x] Repository distant créé et cloné
- [x] Structure de dossiers complète créée
- [x] Fichier .gitignore configuré pour Python/Django
- [x] README.md initial avec titre, description et stack technique
- [x] Commit initial poussé sur la branche main

**Détails techniques**:
- Créer les dossiers: `backend/`, `frontend/`, `database/schemas/`, `database/migrations/`, `simulator/`, `scripts/`, `docs/`
- .gitignore doit inclure: `venv/`, `__pycache__/`, `.env`, `.DS_Store`, `*.pyc`, `db.sqlite3`

---

### TASK-002 : Structure Django de Base
**Responsable**: @dev2  
**Branche**: feature/TASK-002-django-scaffold  
**Dépendances**: TASK-001 ✅

**Objectif**: Initialiser le projet Django avec les applications de base et les dépendances nécessaires.

**Critères d'acceptation**:
- [x] Environnement virtuel Python créé dans `backend/`
- [x] Dépendances installées: django, djangorestframework, django-cors-headers, channels, psycopg2-binary, python-dotenv
- [x] Fichier `requirements.txt` généré
- [x] Projet Django initialisé (nom: `config`)
- [x] Applications créées: `core`, `api`, `alerts`
- [x] Fichier `.env.example` créé avec variables nécessaires
- [x] URLs de base configurées
- [x] Endpoint `/health` fonctionnel retournant `{"status": "ok"}`
- [x] Script `scripts/run_backend.sh` créé

**Détails techniques**:
- Configuration ASGI pour WebSockets
- Middleware CORS configuré
- Structure URLs: `/admin/`, `/api/`, `/health`

---

### TASK-003 : Configuration PostgreSQL Locale
**Responsable**: @dev3  
**Branche**: feature/TASK-003-postgres-config  
**Dépendances**: TASK-001 ✅, TASK-002 ✅

**Objectif**: Installer PostgreSQL, créer la base de données et connecter Django.

**Critères d'acceptation**:
- [x] PostgreSQL 14+ installé localement
- [x] Utilisateur et base de données `cold_room_dev` créés
- [x] Django configuré pour utiliser PostgreSQL via `.env`
- [x] Fichier `.env` créé à partir de `.env.example`
- [x] Migrations par défaut de Django exécutées avec succès
- [x] Script `scripts/init_db.sh` créé
- [x] Documentation dans `database/README.md`

**Détails techniques**:
- Variables d'environnement: `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `DB_HOST`, `DB_PORT`
- Tester la connexion avec `python manage.py migrate`

---

## 🗄️ Phase 1 : Conception de la Base de Données (SQL)

### TASK-101 : Schéma SQL Complet
**Responsable**: @db-dev  
**Branche**: feature/TASK-101-sql-schema  
**Dépendances**: TASK-003 ✅

**Objectif**: Écrire le schéma SQL pur pour les tables principales du système.

**Critères d'acceptation**:
- [ ] Fichier `database/schemas/001_initial_schema.sql` créé
- [ ] Table `sensors` créée avec toutes les colonnes requises
- [ ] Table `sensor_readings` créée avec FK et CASCADE
- [ ] Table `alerts` créée avec relations appropriées
- [ ] Fichier `database/schemas/002_seed_data.sql` avec 4 capteurs de test
- [ ] Fichier `database/schemas/003_indexes.sql` pour optimisation
- [ ] Documentation dans `docs/ARCHITECTURE.md`

**Détails techniques**:

**Table sensors**:
- id (SERIAL PK)
- name (VARCHAR)
- sensor_type (VARCHAR)
- unit (VARCHAR)
- location (VARCHAR)
- min_threshold (DECIMAL)
- max_threshold (DECIMAL)
- is_active (BOOLEAN)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

**Table sensor_readings**:
- id (BIGSERIAL PK)
- sensor_id (FK → sensors ON DELETE CASCADE)
- value (DECIMAL)
- timestamp (TIMESTAMP)

**Table alerts**:
- id (BIGSERIAL PK)
- sensor_id (FK → sensors)
- reading_id (FK → sensor_readings)
- alert_type (VARCHAR)
- severity (VARCHAR)
- message (TEXT)
- is_resolved (BOOLEAN)
- created_at (TIMESTAMP)
- resolved_at (TIMESTAMP)

**Capteurs de test**:
1. Température (°C, -25 à -15)
2. Humidité (%, 40 à 60)
3. Porte (bool, 0 ou 1)
4. Pression (hPa, 1000 à 1020)

---

### TASK-102 : Scripts de Migration SQL Manuels
**Responsable**: @db-dev  
**Branche**: feature/TASK-102-sql-migrations  
**Dépendances**: TASK-101 ✅

**Objectif**: Mettre en place un processus de migration SQL manuel et versionné.

**Critères d'acceptation**:
- [ ] Dossier `database/migrations/` créé
- [ ] Fichier `template_migration.sql` avec sections UP/DOWN
- [ ] Migration d'exemple `001_add_door_sensor.sql` créée
- [ ] Script `scripts/apply_migration.sh` fonctionnel
- [ ] Documentation dans `database/migrations/README.md`

**Détails techniques**:
- Migrations enveloppées dans des transactions
- Règles d'idempotence documentées
- Processus de rollback documenté

---

## ⚙️ Phase 2 : Backend Django - Modèles & Configuration

### TASK-201 : Modèles Django ORM
**Responsable**: @backend1  
**Branche**: feature/TASK-201-django-models  
**Dépendances**: TASK-102 ✅

**Objectif**: Traduire le schéma SQL en modèles Django ORM.

**Critères d'acceptation**:
- [ ] Modèles `Sensor`, `SensorReading`, `Alert` créés dans `api/models.py`
- [ ] Choix (choices) définis pour `sensor_type` et `severity`
- [ ] Relations FK configurées avec `on_delete` appropriés
- [ ] Méthode `__str__()` implémentée pour chaque modèle
- [ ] Meta class configurée pour tri par défaut sur `SensorReading`
- [ ] Migrations Django générées et appliquées

**Détails techniques**:
- sensor_type choices: 'temperature', 'humidity', 'door', 'pressure'
- severity choices: 'info', 'warning', 'critical'
- SensorReading.Meta: ordering = ['-timestamp']

---

### TASK-202 : Configuration Django settings
**Responsable**: @backend2  
**Branche**: feature/TASK-202-django-settings  
**Dépendances**: TASK-201 ✅

**Objectif**: Finaliser la configuration du projet Django (REST Framework, CORS, Timezone).

**Critères d'acceptation**:
- [ ] Django REST Framework configuré (pagination, permissions, rendu)
- [ ] CORS configuré (dev: tout autorisé, prod: domaine spécifique)
- [ ] Timezone configurée sur 'Europe/Paris' ou UTC
- [ ] Dossiers static et media configurés
- [ ] Headers CORS corrects sur requêtes OPTIONS

**Détails techniques**:
- Pagination: PageNumberPagination, page_size=50
- Permissions par défaut: IsAuthenticated
- CORS_ALLOWED_ORIGINS en production

---

### TASK-203 : Système d'authentification
**Responsable**: @backend2  
**Branche**: feature/TASK-203-auth-system  
**Dépendances**: TASK-202 ✅

**Objectif**: Sécuriser l'API avec un système de tokens.

**Critères d'acceptation**:
- [ ] Solution d'authentification par token intégrée (SimpleJWT ou Token DRF)
- [ ] Endpoints créés: inscription, connexion, déconnexion/rafraîchissement
- [ ] Permission globale appliquée sur l'API (sauf health check et réception simulateur)
- [ ] Utilisateur par défaut créé via script/migration
- [ ] Requêtes non authentifiées retournent 401/403

**Détails techniques**:
- URLs: `/api/auth/register/`, `/api/auth/login/`, `/api/auth/refresh/`
- Utilisateur par défaut: username='admin', password='admin123'

---

## 🌐 Phase 3 : API REST

### TASK-301 : Serializers DRF
**Responsable**: @backend1  
**Branche**: feature/TASK-301-serializers  
**Dépendances**: TASK-203 ✅

**Objectif**: Créer les couches de validation et de sérialisation des données.

**Critères d'acceptation**:
- [ ] ModelSerializers créés pour `Sensor`, `SensorReading`, `Alert`
- [ ] SensorReadingSerializer: sensor en écriture (ID), détails en lecture
- [ ] AlertResolveSerializer créé pour résolution d'alertes
- [ ] Validations personnalisées implémentées
- [ ] Tests de validation fonctionnels

**Détails techniques**:
- Validation: valeur cohérente avec sensor_type
- SensorReadingSerializer: sensor = PrimaryKeyRelatedField (write), nested (read)

---

### TASK-302 : API Sensors CRUD
**Responsable**: @backend3  
**Branche**: feature/TASK-302-api-sensors  
**Dépendances**: TASK-301 ✅

**Objectif**: Exposer les opérations CRUD pour les capteurs.

**Critères d'acceptation**:
- [ ] ViewSet créé pour `Sensor`
- [ ] Opérations implémentées: List, Create, Update, Detail, Delete
- [ ] Filtrage par `is_active` et `sensor_type`
- [ ] URLs configurées sous `/api/sensors/`
- [ ] Tests CRUD via Postman/cURL réussis

**Détails techniques**:
- Utiliser ModelViewSet
- Filtres: django-filter ou query params manuels

---

### TASK-303 : API Readings & History
**Responsable**: @backend3  
**Branche**: feature/TASK-303-api-readings  
**Dépendances**: TASK-301 ✅

**Objectif**: Permet l'envoi de données de capteurs et la récupération de l'historique.

**Critères d'acceptation**:
- [ ] Vue de création de `SensorReading` (POST)
- [ ] Vue de liste pour historique (GET) avec pagination
- [ ] Filtres: `sensor_id`, `start_date`, `end_date`
- [ ] URLs configurées sous `/api/readings/`
- [ ] Envoi de lecture met à jour la base
- [ ] Historique filtrable fonctionnel

**Détails techniques**:
- POST `/api/readings/`: {"sensor": 1, "value": -18.5, "timestamp": "2026-05-10T10:00:00Z"}
- GET `/api/readings/?sensor_id=1&start_date=2026-05-01&end_date=2026-05-10`

---

### TASK-304 : API Alerts Management
**Responsable**: @backend1  
**Branche**: feature/TASK-304-api-alerts  
**Dépendances**: TASK-301 ✅

**Objectif**: Fournir l'accès aux alertes et la capacité de les résoudre.

**Critères d'acceptation**:
- [ ] ViewSet créé pour `Alert` (lecture seule: list, detail)
- [ ] Action personnalisée pour résoudre une alerte
- [ ] Filtrage par statut (résolue/en cours) et sévérité
- [ ] URLs configurées sous `/api/alerts/`
- [ ] Alertes listables, filtrables et résolvables

**Détails techniques**:
- Action: POST `/api/alerts/{id}/resolve/`
- Filtres: `is_resolved`, `severity`

---

## 🎨 Phase 4 : Frontend (Vanilla JS + Chart.js)

### TASK-401 : Structure HTML de base
**Responsable**: @frontend1  
**Branche**: feature/TASK-401-html-scaffold  
**Dépendances**: Aucune

**Objectif**: Créer le squelette des pages web.

**Critères d'acceptation**:
- [ ] Fichiers créés: `index.html`, `alerts.html`, `settings.html`
- [ ] Barre de navigation commune intégrée
- [ ] Structure sémantique (header, main, section, footer)
- [ ] Liens vers CSS et JS configurés
- [ ] Navigation entre pages fonctionnelle

---

### TASK-402 : CSS Global & Variables
**Responsable**: @frontend2  
**Branche**: feature/TASK-402-css-global  
**Dépendances**: TASK-401 ✅

**Objectif**: Définir la charte graphique et les composants réutilisables.

**Critères d'acceptation**:
- [ ] Variables CSS définies (couleurs, typographies, espacements)
- [ ] Classes utilitaires pour alertes de sévérité
- [ ] Layout responsive (Grid/Flexbox)
- [ ] Composants de base stylisés (boutons, formulaires, cartes)
- [ ] Thème visuel cohérent (bleu/gris froid)

---

### TASK-403 : Page Dashboard - Layout
**Responsable**: @frontend1  
**Branche**: feature/TASK-403-dashboard-layout  
**Dépendances**: TASK-402 ✅

**Objectif**: Agencer la page principale du tableau de bord.

**Critères d'acceptation**:
- [ ] Page divisée: cartes capteurs (haut) + graphiques (bas)
- [ ] Grille responsive (4 colonnes desktop, empilé mobile)
- [ ] Adaptation correcte aux différentes tailles d'écran

---

### TASK-404 : Page Dashboard - Cartes Capteurs
**Responsable**: @frontend3  
**Branche**: feature/TASK-404-sensor-cards  
**Dépendances**: TASK-403 ✅

**Objectif**: Afficher l'état actuel des capteurs sous forme de cartes.

**Critères d'acceptation**:
- [ ] Template JS de carte créé (nom, valeur, unité, statut)
- [ ] Code JS pour appeler l'API et peupler les cartes
- [ ] Mise à jour périodique implémentée
- [ ] Animation/changement de couleur si dépassement de seuil
- [ ] Cartes affichent les bonnes valeurs en temps réel

---

### TASK-405 : Page Dashboard - Graphiques
**Responsable**: @frontend3  
**Branche**: feature/TASK-405-charts-impl  
**Dépendances**: TASK-403 ✅

**Objectif**: Intégrer Chart.js pour visualiser l'historique des capteurs.

**Critères d'acceptation**:
- [ ] Chart.js intégré
- [ ] Graphiques en ligne créés (température, humidité, pression)
- [ ] Contrôles de plage de temps (1h, 24h, 7 jours)
- [ ] Mise à jour dynamique via API History
- [ ] Courbes se mettent à jour selon la période sélectionnée

---

### TASK-406 : Page Alerts - Liste & Filtres
**Responsable**: @frontend2  
**Branche**: feature/TASK-406-alerts-page  
**Dépendances**: TASK-402 ✅

**Objectif**: Créer l'interface de visualisation et de gestion des alertes.

**Critères d'acceptation**:
- [ ] Tableau HTML pour lister les alertes
- [ ] Contrôles de filtrage (Sévérité, Statut)
- [ ] Bouton "Résoudre" sur chaque alerte active
- [ ] Stylisation des lignes selon sévérité
- [ ] Filtres fonctionnels, résolution met à jour le statut

---

### TASK-407 : Page Settings - Configuration
**Responsable**: @frontend1  
**Branche**: feature/TASK-407-settings-page  
**Dépendances**: TASK-402 ✅

**Objectif**: Permettre la modification des seuils d'alerte des capteurs.

**Critères d'acceptation**:
- [ ] Formulaire créé pour chaque capteur (min/max threshold)
- [ ] Pré-remplissage avec données existantes de l'API
- [ ] Soumission via PUT/PATCH vers l'API
- [ ] Messages de succès/erreur affichés
- [ ] Modifications persistées en base de données

---

## 🔄 Phase 5 : Intégration, Temps Réel & Simulation

### TASK-501 : Service API JavaScript
**Responsable**: @frontend3  
**Branche**: feature/TASK-501-api-service  
**Dépendances**: TASK-304 ✅

**Objectif**: Centraliser les appels réseau côté Frontend.

**Critères d'acceptation**:
- [ ] Module `apiService.js` créé
- [ ] Fonctions async implémentées pour chaque endpoint
- [ ] Ajout automatique du token d'authentification
- [ ] Gestion d'erreur centralisée
- [ ] Pages frontend utilisent exclusivement ce service

---

### TASK-502 : WebSocket temps réel
**Responsable**: @backend3  
**Branche**: feature/TASK-502-websocket  
**Dépendances**: TASK-304 ✅

**Objectif**: Pousser les nouvelles lectures et alertes vers le frontend sans polling.

**Critères d'acceptation**:
- [ ] Django Channels configuré avec Redis/InMemory
- [ ] Consumer WebSocket créé (canal "sensors_live")
- [ ] Vues API émettent événements sur le canal
- [ ] Frontend connecté au WebSocket
- [ ] Dashboard se met à jour instantanément

**Détails techniques**:
- WebSocket URL: `ws://localhost:8000/ws/sensors/`
- Messages: `{"type": "reading", "data": {...}}`, `{"type": "alert", "data": {...}}`

---

### TASK-503 : Détection anomalies backend
**Responsable**: @backend1  
**Branche**: feature/TASK-503-anomaly-detection  
**Dépendances**: TASK-303 ✅

**Objectif**: Détecter automatiquement les problèmes et générer des alertes.

**Critères d'acceptation**:
- [ ] Logique de vérification ajoutée à la création de SensorReading
- [ ] Comparaison valeur vs seuils (min/max)
- [ ] Création automatique d'Alert si hors limites
- [ ] Envoi d'alerte via WebSocket (si TASK-502 terminé)
- [ ] Lecture hors seuil crée immédiatement une alerte

**Détails techniques**:
- Utiliser signal Django `post_save` ou logique dans la vue
- Sévérité: 'critical' si très hors limites, 'warning' si légèrement

---

### TASK-504 : Simulateur IoT Python (REST)
**Responsable**: @sim-dev  
**Branche**: feature/TASK-504-iot-simulator  
**Dépendances**: TASK-303 ✅

**Objectif**: Remplacer les capteurs physiques par un script Python autonome qui simule l'envoi de données réalistes de chambre froide via des requêtes HTTP POST.

**Critères d'acceptation**:
- [ ] Dossier `simulator/` avec environnement virtuel
- [ ] `requirements.txt` créé (requests, schedule, python-dotenv)
- [ ] Fichier `.env` pour configuration (URL API, fréquence)
- [ ] Script génère données réalistes:
  - Température: -18°C ± 2°C
  - Humidité: 45% ± 5%
  - Pression: 1013 hPa ± 5 hPa
  - Porte: booléen (95% fermée)
- [ ] Logique d'anomalies (5% de pics)
- [ ] Utilisation de `schedule` pour envoi périodique
- [ ] Script `scripts/run_simulator.sh` créé
- [ ] Documentation dans `simulator/README.md`
- [ ] Simulateur tourne sans crash
- [ ] Lectures apparaissent via l'API
- [ ] Anomalies déclenchent des alertes

**Détails techniques**:
- Envoi toutes les 10 secondes par défaut
- POST vers `/api/readings/`
- Anomalies: température à -5°C, porte ouverte pendant 30s

---

## 🧪 Phase 6 : Tests & Documentation

### TASK-601 : Tests unitaires backend
**Responsable**: @qa1  
**Branche**: feature/TASK-601-backend-tests  
**Dépendances**: Phase 2 et 3 ✅

**Objectif**: Garantir la fiabilité de l'API et de la logique métier.

**Critères d'acceptation**:
- [ ] Tests unitaires pour modèles
- [ ] Tests d'API (DRF test cases) pour CRUD, filtres, permissions
- [ ] Tests pour détection d'anomalies
- [ ] Configuration de test avec base temporaire
- [ ] Suite de tests réussit à 100%

---

### TASK-602 : Tests frontend manuels
**Responsable**: @qa2  
**Branche**: feature/TASK-602-frontend-tests  
**Dépendances**: Phase 4 et 5 ✅

**Objectif**: Valider l'expérience utilisateur et la cohérence des données.

**Critères d'acceptation**:
- [ ] Plan de test manuel pour chaque page
- [ ] Tests des cas limites (perte connexion, valeurs extrêmes)
- [ ] Vérification responsive design (mobile, tablette)
- [ ] Bugs documentés dans le système de suivi
- [ ] Aucun bug bloquant enregistré

---

### TASK-603 : Documentation finale
**Responsable**: @tech-writer  
**Branche**: feature/TASK-603-docs-final  
**Dépendances**: Toutes les tâches ✅

**Objectif**: Préparer le projet pour la livraison et la maintenance.

**Critères d'acceptation**:
- [ ] README.md principal avec instructions complètes
- [ ] Documentation API REST dans `docs/API.md`
- [ ] `docs/ARCHITECTURE.md` finalisé avec diagrammes
- [ ] FAQ de dépannage ajoutée

**Détails techniques**:
- Inclure: installation, configuration, lancement, troubleshooting
- Diagrammes: schéma DB, flux de données, architecture système
