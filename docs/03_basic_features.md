# 基本的な機能

マークダウンでできることは一通りできます。

=== "出力結果"
    # 見出し
    ## 見出し
    ### 見出し
    #### 見出し
    ##### 見出し
=== "Markdown"
    ```md
    # 見出し
    ## 見出し
    ### 見出し
    #### 見出し
    ##### 見出し
    ```

## 箇条書き

=== "出力結果"
    - あいうえお
    - かきくけこ
        - さしすせそ
        - たちつてと
    - なにぬねの
=== "Markdown"
    ```md
    - あいうえお
    - かきくけこ
        - さしすせそ
        - たちつてと
    - なにぬねの
    ```

## 番号リスト

=== "出力結果"
    1. アイウエオ
    1. カキクケコ
        1. サシスセソ
        1. タチツテト
    1. ナニヌネノ
=== "Markdown"
    ```md
    1. アイウエオ
    1. カキクケコ
        1. サシスセソ
        1. タチツテト
    1. ナニヌネノ
    ```

## 表サポート

表を作れます。

=== "出力結果"
    1つ目のヘッダー | 2つ目のヘッダー | 3つ目のヘッダー
    ------------ | ------------- | ------------
    コンテンツ１・１ | コンテンツ１：２  | コンテンツ１・３
    コンテンツ２・１ | コンテンツ２：２  | コンテンツ２・３
=== "Markdown"
    ```md
    1つ目のヘッダー | 2つ目のヘッダー | 3つ目のヘッダー
    ------------ | ------------- | ------------
    コンテンツ１・１ | コンテンツ１：２  | コンテンツ１・３
    コンテンツ２・１ | コンテンツ２：２  | コンテンツ２・３
    ```

## 画像

以下のようにすると画像を挿入できます。

```md
![](./eclipse.jpg)
```

![](./eclipse.jpg)

## コード挿入

コードを挿入できます。

=== "出力結果"
    ```cpp linenums="1"
    #include <iostream>

    int main()
    {
        std::cout << "Hello world!" << std::endl;
    }
    ```
=== "Markdown"
    ````md
    ```cpp linenums="1"
    #include <iostream>

    int main()
    {
        std::cout << "Hello world!" << std::endl;
    }
    ```
    ````

ハイライトも入れられます。

=== "出力結果"
    ```cpp linenums="1" hl_lines="5 6"
    #include <iostream>

    int main()
    {
        std::cout << "Hello world!" << std::endl;
        return 0;
    }
    ```
=== "Markdown"
    ````md
    ```cpp linenums="1" hl_lines="5 6"
    #include <iostream>

    int main()
    {
        std::cout << "Hello world!" << std::endl;
        return 0;
    }
    ```
    ````

## 警告文

!!! note
    ノート
!!! tip
    Tip
!!! warning
    警告
!!! danger
    危険
!!! success
    成功
!!! failure
    失敗
!!! bug
    バグ
!!! summary
    まとめ
!!! example
    例

```md
!!! Note
    ノート
!!! Tip
    Tip
!!! Warning
    警告
!!! Danger
    危険
!!! Success
    成功
!!! Failure
    失敗
!!! Bug
    バグ
!!! summary
    まとめ
!!! example
    例
```

## 脚注

脚注[^1]も入れられます。
[^1]: 脚注とは本文の下の方につける注記のこと。