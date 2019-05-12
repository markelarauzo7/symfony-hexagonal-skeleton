.PHONY: list check-migrations migrate clear-cache lint test

list:
	php bin/console list

check-migrations:
	php bin/console doctrine:migrations:status	

migrate:
	php bin/console doctrine:migrations:migrate --no-interaction

clear-cache:
	php bin/console cache:clear

lint:
	./vendor/bin/parallel-lint . --exclude vendor
        
style: 
	./vendor/bin/phpcs -p --standard=PSR2 src tests
        
fix-style: 
	./vendor/bin/phpcbf -p --standard=PSR2 src tests

test: lint style
	./vendor/bin/phpunit --configuration phpunit.xml
