# sample for mkdocs

mkdocsが便利そうだったので使い方をまとめます。楽に使えるようにDockerコンテナを作製・配布します。

## 使い方

- コマンドプロンプトの場合

```
docker run --rm -it -p 8000:8000 "%cd%":/docs xxxx/mkdocs:latest
```

- パワーシェルの場合

```
docker run --rm -it -p 8000:8000 ${PWD}:/docs xxxx/mkdocs:latest
```

- bashの場合

```
docker run --rm -it -p 8000:8000 $(pwd):/docs xxxx/mkdocs:latest
```


