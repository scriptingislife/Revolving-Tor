build:
	docker rmi revolving-tor || echo "revolving-tor images doesn't exist yet. building."
	docker build -t revolving-tor .

run:
	docker run -it --rm --name rev-tor --entrypoint=/bin/sh -p 9060:9060 -p 13050:13050 revolving-tor

daemon:
	docker run -t -d --rm --name rev-tor --entrypoint=/bin/sh -p 9060:9060 -p 13050:13050 revolving-tor

stop kill:
	docker kill rev-tor