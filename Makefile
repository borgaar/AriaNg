build:
	docker build -t borgaaar/downloader:1.0 .

release:
	docker rm -f downloader | true
	docker run -d --name downloader -p 9000:9000 borgaaar/downloader:1.0
	docker ps
