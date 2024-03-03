all:
	docker compose -f srcs/docker-compose.yml up --build -d

build:
	docker compose -f srcs/docker-compose.yml build

stop:
	docker compose -f srcs/docker-compose.yml stop

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all -v \
	&& sudo rm -rf /Users/rnaka/data/mysql/* /Users/rnaka/data/wordpress/*
	# && sudo rm -rf /home/rnaka/data/mysql/* /home/rnaka/data/wordpress/*

exe-nginx:
	docker compose -f srcs/docker-compose.yml exec nginx bash

exe-mariadb:
	docker compose -f srcs/docker-compose.yml exec mariadb bash

exe-wordpress:
	docker compose -f srcs/docker-compose.yml exec wordpress bash

prune-images:
	docker image prune -fa

prune:
	docker system prune -f

logs:
	docker compose -f srcs/docker-compose.yml logs

.PHONY: all build stop clean exec-nginx ips prune-images prune logs help

help:
	@echo "利用可能なコマンド:"
	@echo "  all           - コンテナをビルドしてバックグラウンドで起動します。"
	@echo "  build         - Docker Composeファイルに基づいてイメージをビルドします。"
	@echo "  stop          - 実行中のすべてのコンテナを停止します。"
	@echo "  clean         - コンテナを停止し、コンテナ、ネットワーク、イメージ、ボリュームを削除します。"
	@echo "  exec-nginx    - nginxコンテナでbashセッションを開始します。"
	@echo "  prune-images  - 未使用のDockerイメージを全て削除します。"
	@echo "  prune         - 未使用のコンテナ、ネットワーク、イメージ、ビルドキャッシュを削除します。"
	@echo "  logs          - 全てのコンテナのログを表示します。"
