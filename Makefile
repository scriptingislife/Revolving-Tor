build:
	docker rmi revolving-tor || echo "revolving-tor images doesn't exist yet. building."
	docker build -t revolving-tor .

run:
	docker run -it --rm --name rev-tor -p 4000:4000 -p 8080:8080 revolving-tor

test: build run
	echo "Hope it went well!"

daemon:
	docker run -t -d --rm --name rev-tor -p 4000:4000 -p 8080:8080 revolving-tor

stop kill:
	docker kill rev-tor
