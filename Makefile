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
	
.PHONY: test
test: 
	./bin/phpstan analyse src tests
	# PHPCBF does not follow POSIX standards and return 1 even when succesful
	./bin/phpcbf -p --standard=PSR2 src tests || true
	./bin/phpunit tests

.PHONY: test-with-coverage
test-with-coverage:
	./bin/phpstan analyse src tests
	# PHPCBF does not follow POSIX standards and return 1 even when succesful
	./bin/phpcbf -p --standard=PSR2 src tests || true
	./bin/phpunit --coverage-html public/coverage-report

.PHONY: paratest
paratest:
	./bin/phpstan analyse src tests
	# PHPCBF does not follow POSIX standards and return 1 even when succesful
	./bin/phpcbf -p --standard=PSR2 src tests || true
	./bin/paratest -p half tests

.PHONY: start
start:
	php bin/console server:start --docroot=public

.PHONY: stop
stop:
	php bin/console server:stop

.PHONY: dep
dep:
	composer install