.PHONY: list
list:
	php bin/console list

.PHONY: about
about:
	php bin/console about

.PHONY: show-mappings
show-mappings:
	php bin/console doctrine:mapping:info

.PHONY: check-mappings
check-mappings:
	php bin/console doctrine:schema:validate

.PHONY: show-migrations
show-migrations:
	php bin/console doctrine:migrations:status	--show-versions

.PHONY: migrate
migrate:
	php bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration

.PHONY: diff-migration
diff-migration:
	php bin/console doctrine:migrations:diff

.PHONY: clear-cache
clear-cache:
	php bin/console cache:clear

.PHONY: prod-clear-cache
prod-clear-cache:
	APP_ENV=prod APP_DEBUG=0 php bin/console cache:clear

.PHONY: analyse
analyse:
	./bin/phpstan analyse src tests

.PHONY: style
style:
	# PHPCS does not follow POSIX standards and return 1 even when succesful
	./bin/phpcs -p --standard=PSR2 src tests || true

.PHONY: fix-style       
fix-style:
	# PHPCBF does not follow POSIX standards and return 1 even when succesful
	./bin/phpcbf -p --standard=PSR2 src tests || true

.PHONY: test
test: analyse fix-style
	./bin/phpunit tests

.PHONY: test-with-coverage
test-with-coverage: analyse fix-style
	./bin/phpunit --coverage-html public/coverage-report

.PHONY: paratest
paratest: analyse fix-style
	./bin/paratest -p half tests

.PHONY: webserver-start
webserver-start:
	php bin/console server:start --docroot=public