build:
	docker build -t borgaaar/ariang:1.0 .

release:
	docker rm -f ariang | true
	docker run -d --name ariang -p 9000:9000 borgaaar/ariang:1.0
	docker ps
