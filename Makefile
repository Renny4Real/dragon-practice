build:
	docker-compose build

setup: build
	docker-compose run --rm app rails db:create db:migrate

test:
	docker-compose run --rm app rspec

serve:
	docker-compose up
