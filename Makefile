.PHONY: deps
deps:
	go get -u github.com/go-swagger/go-swagger/cmd/swagger@v0.27.0

.PHONY: gen
gen:
	swagger generate server \
	--api-package realworld \
	--name realworld \
	--target generated \
	--spec ./swagger/swagger.yml \
	--strict-additional-properties \
	--exclude-main

.PHONY: install
install:
	go get ./...

.PHONY: run
run:
	go run gen/cmd/realworld-server/main.go --host 0.0.0.0 --port 3000

.PHONY: open
open:
	open http://localhost:3000/hello?name=hello-go-swagger
