
# 使い方

## mkdocs serve

`127.0.0.1:8000`に静的サイトを立ち上げてくれます。

=== "CMD"
    ```cmd
    docker run --rm -it -p 8000:8000 "%cd%":/docs ryo4432/mkdocs:latest
    ```
=== "PowerShell"
    ```powershell
    docker run --rm -it -p 8000:8000 ${PWD}:/docs ryo4432/mkdocs:latest
    ```
=== "bash"
    ```bash
    docker run --rm -it -p 8000:8000 $(pwd):/docs ryo4432/mkdocs:latest
    ```


## mkdocs build

`site`フォルダ以下にhtmlファイルを生成してくれます。

=== "CMD"
    ```cmd
    docker run --rm -it -p 8000:8000 "%cd%":/docs ryo4432/mkdocs:latest build
    ```
=== "PowerShell"
    ```powershell
    docker run --rm -it -p 8000:8000 ${PWD}:/docs ryo4432/mkdocs:latest build
    ```
=== "bash"
    ```bash
    docker run --rm -it -p 8000:8000 $(pwd):/docs ryo4432/mkdocs:latest build
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
├── mkdocs.yml  
