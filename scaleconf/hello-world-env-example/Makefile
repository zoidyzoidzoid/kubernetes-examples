build:
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
	docker build -t zoidbergwill/hello-world:latest .

build_v1:
	git checkout 0.1
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
	docker build -t zoidbergwill/hello-world:1 .

build_v2:
	git checkout 0.2
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
	docker build -t zoidbergwill/hello-world:2 .
