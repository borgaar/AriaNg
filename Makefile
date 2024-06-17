build:
	npm install
	npm run dev

release:
	docker rm -f downloader || true
	docker system prune -f
	docker-compose -f docker-compose.yml up -d
