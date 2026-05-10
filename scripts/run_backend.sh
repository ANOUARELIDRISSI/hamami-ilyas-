#!/bin/bash

# Script to run the Django backend server

echo "🚀 Starting Django Backend Server..."

# Navigate to backend directory
cd "$(dirname "$0")/../backend" || exit

# Activate virtual environment
if [ -d "venv/bin" ]; then
    source venv/bin/activate
elif [ -d "venv/Scripts" ]; then
    source venv/Scripts/activate
else
    echo "❌ Virtual environment not found. Please run setup first."
    exit 1
fi

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  .env file not found. Creating from .env.example..."
    cp .env.example .env
    echo "✅ .env file created. Please update it with your configuration."
fi

# Run migrations
echo "📦 Running migrations..."
python manage.py migrate

# Start the development server
echo "✅ Starting server on http://127.0.0.1:8000"
python manage.py runserver
