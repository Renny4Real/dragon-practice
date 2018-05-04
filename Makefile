build:
	docker-compose build

test:
	docker-compose run --rm app rspec

serve:
	docker-compose up
