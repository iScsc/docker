CHALLENGE = challenge
HOST = ubuntu

all: build run
challenge: build run

build:
	@echo "building challenge"
	@sudo docker build -t $(CHALLENGE) . > ./.log/build

run:
	@echo "running challenge"
	@sudo docker run -h $(HOST) --rm -it $(CHALLENGE)
