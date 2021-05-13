current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)

.PHONY: analyse
analyse:
	docker-compose exec php ./bin/phpstan analyse -c phpstan.neon

.PHONY: fix-style       
fix-style:
	# have a look at ruleset at: https://mlocati.github.io/php-cs-fixer-configurator/
	# Will use rules set at .php_cs.dist
	docker-compose exec php ./bin/php-cs-fixer fix src --verbose
	docker-compose exec php ./bin/php-cs-fixer fix tests --verbose

.PHONY: test
test: analyse fix-style
	docker-compose exec php ./bin/phpunit tests

.PHONY: test-unit
test-unit: analyse fix-style
	docker-compose exec php ./bin/phpunit tests --exclude-group=E2E,Integration

.PHONY: paratest
paratest:analyse fix-style
	docker-compose exec php ./bin/paratest -p half tests

.PHONY: deps
deps: composer-install

# 🐘 Composer
.PHONY: composer-install
composer-install: CMD=install

.PHONY: composer-update
composer-update: CMD=update

.PHONY: composer-require
composer-require: CMD=require
composer-require: INTERACTIVE=-ti --interactive

.PHONY: composer-require-dev
composer-require-dev: CMD=require --dev
composer-require-dev: INTERACTIVE=-ti --interactive

.PHONY: composer
composer composer-install composer-update composer-require composer-require-dev:
	docker run --rm $(INTERACTIVE) --volume $(current-dir):/app --user $(CURRENT_UID):$(CURRENT_GID) \
		composer:2 $(CMD) \
			--ignore-platform-reqs \
			--no-ansi

# 🐳 Docker Compose
.PHONY: start
start: CMD=up --build -d

.PHONY: status
status: CMD=ps 

.PHONY: stop
stop: CMD=down

.PHONY: php-interactive
php-interactive: CMD=exec php /bin/bash

.PHONY: php-logs
php-logs: CMD=logs -f php 

# Usage: `make doco CMD="ps --services"`
# Usage: `make doco CMD="build --parallel --pull --force-rm --no-cache"`
.PHONY: doco
doco start stop status php-interactive php-logs:
	docker-compose $(CMD)

