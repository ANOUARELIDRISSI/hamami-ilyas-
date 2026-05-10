#!/bin/bash

# Script to initialize the PostgreSQL database for cold_room_dev

set -e

echo "🗄️  Initializing PostgreSQL database for Cold Room Monitoring..."

# Load environment variables from backend/.env if it exists
ENV_FILE="$(dirname "$0")/../backend/.env"
if [ -f "$ENV_FILE" ]; then
    export $(grep -v '^#' "$ENV_FILE" | xargs)
    echo "✅ Loaded environment variables from .env"
else
    echo "⚠️  No .env file found. Using default values."
fi

# Set defaults if not provided
DB_NAME="${DB_NAME:-cold_room_dev}"
DB_USER="${DB_USER:-postgres}"
DB_PASSWORD="${DB_PASSWORD:-postgres}"
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"

echo "📋 Database configuration:"
echo "   Host:     $DB_HOST:$DB_PORT"
echo "   Database: $DB_NAME"
echo "   User:     $DB_USER"

# Create the database user (if it doesn't exist)
echo ""
echo "👤 Creating database user '$DB_USER' (if not exists)..."
psql -h "$DB_HOST" -p "$DB_PORT" -U postgres -tc \
    "SELECT 1 FROM pg_roles WHERE rolname='$DB_USER'" | grep -q 1 || \
    psql -h "$DB_HOST" -p "$DB_PORT" -U postgres -c \
    "CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';"

# Create the database (if it doesn't exist)
echo "🏗️  Creating database '$DB_NAME' (if not exists)..."
psql -h "$DB_HOST" -p "$DB_PORT" -U postgres -tc \
    "SELECT 1 FROM pg_database WHERE datname='$DB_NAME'" | grep -q 1 || \
    psql -h "$DB_HOST" -p "$DB_PORT" -U postgres -c \
    "CREATE DATABASE $DB_NAME OWNER $DB_USER;"

# Grant privileges
echo "🔑 Granting privileges..."
psql -h "$DB_HOST" -p "$DB_PORT" -U postgres -c \
    "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"

echo ""
echo "✅ Database '$DB_NAME' is ready."

# Run Django migrations
echo ""
echo "📦 Running Django migrations..."
cd "$(dirname "$0")/../backend" || exit

if [ -d "venv/bin" ]; then
    source venv/bin/activate
elif [ -d "venv/Scripts" ]; then
    source venv/Scripts/activate
else
    echo "❌ Virtual environment not found. Please create it first:"
    echo "   cd backend && python -m venv venv && pip install -r requirements.txt"
    exit 1
fi

python manage.py migrate

echo ""
echo "🎉 Database initialization complete!"
echo "   You can now run the backend with: scripts/run_backend.sh"
