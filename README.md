# docker-laravel 🐳

<p align="center">
    <img src="https://user-images.githubusercontent.com/35098175/145682384-0f531ede-96e0-44c3-a35e-32494bd9af42.png" alt="docker-laravel">
</p>
<p align="center">
    <img src="https://github.com/ucan-lab/docker-laravel/actions/workflows/laravel-create-project.yml/badge.svg" alt="Test laravel-create-project.yml">
    <img src="https://github.com/ucan-lab/docker-laravel/actions/workflows/laravel-git-clone.yml/badge.svg" alt="Test laravel-git-clone.yml">
    <img src="https://img.shields.io/github/license/ucan-lab/docker-laravel" alt="License">
</p>

## Introduction

Build a simple laravel development environment with docker-compose. Compatible with Windows(WSL2), macOS(M1) and Linux.

## Usage

### Create an initial Laravel project

1. Click [Use this template](https://github.com/ucan-lab/docker-laravel/generate)
2. Git clone & change directory
3. Execute the following command

```bash
$ task create-project

# or...

$ make create-project

# or...

$ mkdir -p src
$ docker compose build
$ docker compose up -d
$ docker compose exec app composer create-project --prefer-dist laravel/laravel .
$ docker compose exec app php artisan key:generate
$ docker compose exec app php artisan storage:link
$ docker compose exec app chmod -R 777 storage bootstrap/cache
$ docker compose exec app php artisan migrate
```

http://localhost

### Create an existing Laravel project

1. Git clone & change directory
2. Execute the following command

```bash
$ task install

# or...

$ make install

# or...

$ docker compose build
$ docker compose up -d
$ docker compose exec app composer install
$ docker compose exec app cp .env.example .env
$ docker compose exec app php artisan key:generate
$ docker compose exec app php artisan storage:link
$ docker compose exec app chmod -R 777 storage bootstrap/cache
```

http://localhost

## Tips

-   Read this [Taskfile](https://github.com/ucan-lab/docker-laravel/blob/main/Taskfile.yml).
-   Read this [Makefile](https://github.com/ucan-lab/docker-laravel/blob/main/Makefile).
-   Read this [Wiki](https://github.com/ucan-lab/docker-laravel/wiki).

## Container structures

```bash
├── app
├── web
└── db
```

### app container

-   Base image
    -   [php](https://hub.docker.com/_/php):8.3-fpm-bullseye
    -   [composer](https://hub.docker.com/_/composer):2.7

### web container

-   Base image
    -   [nginx](https://hub.docker.com/_/nginx):1.25

### db container

-   Base image
    -   [mysql/mysql-server](https://hub.docker.com/r/mysql/mysql-server):8.0

### mailpit container

-   Base image
    -   [axllent/mailpit](https://hub.docker.com/r/axllent/mailpit)

<!-- 補足 -->
<!-- src/frontendにReactPJTが作成されない場合の対処法; -->

ボリュームマウントを一時的に無効にする:
docker-compose.yml の frontend サービスからボリュームマウントを削除します。

yamlCopyfrontend:
build:
context: ./docker/frontend
dockerfile: Dockerfile
ports: - "3000:3000"

# volumes:

# - ./src/frontend:/app

Dockerfile を修正して、React プロジェクトを直接作成:

dockerfileCopyFROM node:18

WORKDIR /app

RUN npx create-react-app .

EXPOSE 3000

CMD ["npm", "start"]

コンテナをビルドし直して実行:

bashCopydocker-compose down
docker-compose build --no-cache
docker-compose up -d

コンテナ内でプロジェクトが作成されたことを確認:

bashCopydocker-compose exec frontend ls -la

プロジェクトファイルをホストマシンにコピー:
