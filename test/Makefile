CHALLENGE = challenge
HOST = ubuntu

all: build run
challenge: build run

build:
	@echo "building challenge"
	@sudo docker build -t $(CHALLENGE) .

run:
	@echo "running challenge"
	@sudo docker run -h $(HOST) --rm -it $(CHALLENGE)
