.PHONY: help check-pray install plan apply verify drift update publish serve package clean release

PRAY ?= pray
DIST_ROOT := ./prayers
SERVE_HOST ?= 127.0.0.1
SERVE_PORT ?= 7429
PACKAGE_DIR ?=

.DEFAULT_GOAL := help

help:
	@echo "amkisko prayers Makefile"
	@echo ""
	@echo "Publisher (this repo):"
	@echo "  make install          resolve Prayfile.lock"
	@echo "  make plan             preview AGENTS.md render"
	@echo "  make apply            render managed files"
	@echo "  make verify           checksum and marker checks"
	@echo "  make drift            drift report before review"
	@echo "  make update           check for newer package versions"
	@echo "  make publish          update prayers/v1 distribution metadata"
	@echo "  make release          publish, plan, apply, verify"
	@echo "  make serve            local distribution server"
	@echo "  make package PACKAGE_DIR=packages/<name>   build local .praypkg"
	@echo "  make clean            remove root *.praypkg scratch from package builds"
	@echo ""
	@echo "Variables:"
	@echo "  PRAY=$(PRAY)  DIST_ROOT=$(DIST_ROOT)  SERVE_HOST=$(SERVE_HOST)  SERVE_PORT=$(SERVE_PORT)"

check-pray:
	@command -v $(PRAY) >/dev/null 2>&1 || { \
		echo "pray not found; install with:"; \
		echo "  cargo install --git https://github.com/kiskolabs/pray --locked pray"; \
		exit 1; \
	}

install: check-pray
	$(PRAY) install

plan: check-pray
	$(PRAY) plan

apply: check-pray
	$(PRAY) apply

verify: check-pray
	$(PRAY) verify

drift: check-pray
	$(PRAY) drift

update: check-pray
	$(PRAY) update

publish: check-pray
	$(PRAY) publish --root $(DIST_ROOT)

serve: check-pray
	$(PRAY) serve --root $(DIST_ROOT) --host $(SERVE_HOST) --port $(SERVE_PORT)

package: check-pray
	@test -n "$(PACKAGE_DIR)" || { \
		echo "usage: make package PACKAGE_DIR=packages/<name>"; \
		exit 1; \
	}
	$(PRAY) package $(PACKAGE_DIR)

clean:
	@find . -maxdepth 1 -name '*.praypkg' -delete 2>/dev/null || true
	@echo "removed root *.praypkg scratch files"

release: publish plan apply verify
