.PHONY: help check-ruby check-pray check-agent-context check-artifacts check-prayer-prose catalog-topics validate-skills test install plan apply verify drift update publish serve package clean release

PRAY ?= pray
PRAY_MIN_VERSION := 1.26.0
RUBY ?= ruby
RUBY_MIN_VERSION := 3.4.0
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
	@echo "  make check-agent-context  fail when AGENTS.md exceeds 16 KiB"
	@echo "  make check-artifacts  catalog .praypkg files exist and are git-tracked"
	@echo "  make catalog-topics   rewrite derived_metadata.topics from package summaries"
	@echo "  make validate-skills  package SKILL.md frontmatter via Ruby YAML"
	@echo "  make check-prayer-prose  fail governed prose with tables, bold, or non-ASCII punctuation"
	@echo "  make test             skill, artifact, catalog topic, prayer prose, and security-audit run specs"
	@echo "  make drift            drift report before review"
	@echo "  make update           check for newer package versions"
	@echo "  make publish          update prayers/v1 from the Prayfile publish remote"
	@echo "  make release          validate-skills, publish (with catalog-topics), plan, apply, verify, check-artifacts"
	@echo "  make serve            local distribution server"
	@echo "  make package PACKAGE_DIR=packages/<name>   build local .praypkg"
	@echo "  make clean            remove root *.praypkg scratch from package builds"
	@echo ""
	@echo "Variables:"
	@echo "  PRAY=$(PRAY) (>= $(PRAY_MIN_VERSION))  RUBY=$(RUBY) (>= $(RUBY_MIN_VERSION))"
	@echo "  DIST_ROOT=$(DIST_ROOT)  SERVE_HOST=$(SERVE_HOST)  SERVE_PORT=$(SERVE_PORT)"

check-ruby:
	@$(RUBY) usr/scripts/check_tool_version.rb Ruby $(RUBY_MIN_VERSION) $(RUBY) --version || { \
		echo "use Ruby $(RUBY_MIN_VERSION) or newer, or set RUBY=/path/to/ruby"; \
		exit 1; \
	}

check-pray: check-ruby
	@command -v $(PRAY) >/dev/null 2>&1 || { \
		echo "pray not found; install with:"; \
		echo "  cargo install --git https://github.com/kiskolabs/pray --locked pray"; \
		exit 1; \
	}
	@$(RUBY) usr/scripts/check_tool_version.rb Pray $(PRAY_MIN_VERSION) $(PRAY) --version || { \
		echo "install the current Rust CLI or set PRAY=/path/to/pray"; \
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

check-artifacts: check-ruby
	$(RUBY) usr/scripts/check_artifacts.rb $(DIST_ROOT)

check-agent-context: check-ruby
	$(RUBY) usr/scripts/check_agent_context.rb AGENTS.md

catalog-topics: check-ruby
	$(RUBY) usr/scripts/catalog_topics.rb $(DIST_ROOT)

validate-skills: check-ruby
	$(RUBY) usr/scripts/validate_skill.rb

check-prayer-prose: check-ruby
	$(RUBY) usr/scripts/check_prayer_prose.rb .

test: check-ruby
	$(RUBY) usr/scripts/check_tool_version_test.rb
	$(RUBY) usr/scripts/check_agent_context_test.rb
	$(RUBY) usr/scripts/validate_skill_test.rb
	$(RUBY) usr/scripts/check_artifacts_test.rb
	$(RUBY) usr/scripts/catalog_topics_test.rb
	$(RUBY) usr/scripts/check_prayer_prose_test.rb
	$(RUBY) usr/scripts/check_prayer_prose.rb .
	$(RUBY) usr/scripts/check_agent_context.rb AGENTS.md
	$(RUBY) usr/scripts/security_audit_run_test.rb

drift: check-pray
	$(PRAY) drift

update: check-pray
	$(PRAY) update

publish: check-pray
	$(PRAY) publish
	$(MAKE) catalog-topics

serve: check-pray
	$(PRAY) serve --to prayers --host $(SERVE_HOST) --port $(SERVE_PORT)

package: check-pray
	@test -n "$(PACKAGE_DIR)" || { \
		echo "usage: make package PACKAGE_DIR=packages/<name>"; \
		exit 1; \
	}
	$(PRAY) package $(PACKAGE_DIR)

clean:
	@find . -maxdepth 1 -name '*.praypkg' -delete 2>/dev/null || true
	@echo "removed root *.praypkg scratch files"

release: validate-skills check-prayer-prose publish plan apply verify check-agent-context check-artifacts
