
# 使い方

## ローカルホストで確認

以下のdockerコマンドで`127.0.0.1:8000`に静的サイトを立ち上げてくれます。  

=== "CMD"
    ```cmd
    docker run --rm -it -p 8000:8000 -v "%cd%":/docs ryo4432/mkdocs:latest
    ```
=== "PowerShell"
    ```powershell
    docker run --rm -it -p 8000:8000 -v ${PWD}:/docs ryo4432/mkdocs:latest
    ```
=== "bash"
    ```bash
    docker run --rm -it -p 8000:8000 -v $(pwd):/docs ryo4432/mkdocs:latest
    ```

mkdocsの内部的には以下を実行しています(Dockerでは0.0.0.0にアップしようとしている。)

```bash
$ mkdocs serve
```

## html生成

次のdockerコマンドで`site`フォルダ以下にhtmlファイルを生成してくれます。 

=== "CMD"
    ```cmd
    docker run --rm -v "%cd%":/docs ryo4432/mkdocs:latest build
    ```
=== "PowerShell"
    ```powershell
    docker run --rm -v ${PWD}:/docs ryo4432/mkdocs:latest build
    ```
=== "bash"
    ```bash
    docker run --rm -v $(pwd):/docs ryo4432/mkdocs:latest build
    ```
 
mkdocsの内部的には以下のコマンドを実行します。

```bash
$ mkdocs build
```

## デプロイ

github pagesへのデプロイを1コマンドでやってくれます。

=== "CMD"
    ```cmd
    docker run --rm -v "%cd%":/docs ryo4432/mkdocs:latest gh-deploy
    ```
=== "PowerShell"
    ```powershell
    docker run --rm -v ${PWD}:/docs ryo4432/mkdocs:latest gh-deploy
    ```
=== "bash"
    ```bash
    docker run --rm -v $(pwd):/docs ryo4432/mkdocs:latest gh-deploy
    ```
 
mkdocsの内部的には以下のコマンドを実行します。

```bash
$ mkdocs gh-deploy
```

## フォルダ構成

フォルダ構成は以下の通り。マークダウンと構成ファイルである`mkdocs.yml`があればOK。このおかげで`mkdocs.yml`を後付けすれば既存のマークダウンに手を加えなくても静的サイトができる。`docs`フォルダに納めなくてもmkdocs.ymlでマークダウンの保存先フォルダを指定できるのでこの構成でなければならないというわけではない。

├── docs  
│&emsp;&emsp;├── index.md  
│&emsp;&emsp;├── chap01.md  
│&emsp;&emsp;├── chap02.md  
│&emsp;&emsp;├── chap03.md  
│&emsp;&emsp;├── chap04.md  
│&emsp;&emsp;└── pics  
│&emsp;&emsp;&emsp;&emsp;&emsp;├── pic01.png  
│&emsp;&emsp;&emsp;&emsp;&emsp;└── pic02.png  
└── mkdocs.yml  

## pdf生成

[mkpdfs-mkdocs-plugin](https://github.com/comwes/mkpdfs-mkdocs-plugin)を使ってpdfを生成できます。  
CSSスタイルがダメなのか，まだ完ぺきではないですが`mkdocs build`でPDFを生成できます。