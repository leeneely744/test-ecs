AWS ECS の練習のためのリポジトリです。

https://pages.awscloud.com/JAPAN-event-OE-Hands-on-for-Beginners-ECS-2022-confirmation_012.html

↑のハンズオンはCloud9を使ってやった。
第2段階としてローカルでやる。

第3段階ではGoの何かのAPIを作成する。

# ステップ1

Dockerfile作成

# ステップ2: イメージビルド

```
> docker build -t hello-world .
> docker images
REPOSITORY    TAG       IMAGE ID       CREATED          SIZE
hello-world   latest    90fa85da1864   32 seconds ago   205MB
```

コンテナ作成

`docker run -d -p 8080:80 --name h4b-local-run hello-world`

`-d` バックグラウンドモード
`-p 8080:80` ホストマシンの8080番ポートをコンテナの80番ポートにマッピング
`--name h4b-local-run` コンテナの名前
`hello-world` もとになるDockerイメージの名前


```
> docker run -d -p 8080:80 --name h4b-local-run hello-world

> docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                  NAMES
f83ef8194d89   hello-world   "/bin/sh -c /root/ru…"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->80/tcp   h4b-local-run

> curl localhost:8080
Hello World
```

