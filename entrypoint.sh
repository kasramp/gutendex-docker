#!/bin/sh
set -e

mkdir -p /app/media

echo "Running migrations..."
python manage.py migrate --noinput

echo "Updating catalog..."
python manage.py updatecatalog

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Starting server..."
exec "$@"