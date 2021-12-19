build: config
	docker build -t nvim:base ./
config:
	chmod +x ./get_configs.sh && ./get_configs.sh
