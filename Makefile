build:
	pnpm install
	pnpm run dev

release:
	docker-compose -f ariang/docker-compose.yml down || true
	docker image rm -f $(docker image ls -q) || true
	docker system prune -f
	docker-compose -f ariang/docker-compose.yml up -d --build
