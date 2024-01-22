ARTIFACTS_DIR ?= build

build-HelloWorldFunction:
	docker build -t janet-lambda-example .
	docker run --rm janet-lambda-example cat build/bootstrap > $(ARTIFACTS_DIR)/bootstrap
	chmod +x $(ARTIFACTS_DIR)/bootstrap
