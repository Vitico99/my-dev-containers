build: config
	docker build -t python:dev ./
config:
	chmod +x ./get_configs.sh && ./get_configs.sh
