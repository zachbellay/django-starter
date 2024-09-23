# Development commands
dev-build:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml build

dev-up:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml up -d
	make dev-logs

dev-down:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml down

dev-logs:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml logs -f

dev-shell:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml exec web /bin/bash

# Django commands
migrate:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml exec web python manage.py migrate

makemigrations:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml exec web python manage.py makemigrations

collectstatic:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml exec web python manage.py collectstatic --noinput

createsuperuser:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml exec web python manage.py createsuperuser

# Cleanup
clean:
	docker compose --env-file .env.dev -f docker-compose.dev.yaml down -v
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete


.PHONY: dev-build dev-up dev-down dev-logs dev-shell migrate makemigrations collectstatic createsuperuser test lint clean help
