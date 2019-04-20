build:
	docker build -t revolving-tor .

run:
	docker run -it --rm --name rev-tor --entrypoint=/bin/sh revolving-tor