###
# Magent Image Builder
###

repo = github.com/elct9620/magent

ifndef BUILD_TAG
	BUILD_TAG = $(shell git describe --tags `git rev-list --tags --max-count=1 2> /dev/null` 2> /dev/null || echo 'dev')
endif

GO_FILES = $(wildcard *.go)
GO_PACKAGES = cmd/magent object object/store user user/store
GO_PACKAGES_WITH_REPO = $(addprefix $(repo)/,$(GO_PACKAGES))

IMAGE = elct9620/magent:$(BUILD_TAG)
DEV_IMAGE = elct9620/magent

BINARY_DEST_DIR = rootfs/bin

build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 godep go build -a -installsuffix -v -ldflags '-s' -o $(BINARY_DEST_DIR)/magent cmd/magent/magent.go || exit 1
	docker build -t $(IMAGE) .
	rm rootfs/bin/magent

clean:
	docker rmi $(IMAGE)

release:
	docker push $(IMAGE)

run:
	@# TODO: Add environment setup at here
	@go run cmd/magent/magent.go

test:
	# TODO: Add unit test at here
	@echo "Test script not ready."
