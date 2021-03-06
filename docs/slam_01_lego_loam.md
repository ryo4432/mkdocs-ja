# LeGO-LOAM

[LeGO-LOAM](https://github.com/RobustFieldAutonomyLab/LeGO-LOAM)の論文を読み，内容を整理する。

## 概要

- 軽量で，組み込みシステムに実装可能
- リアルタイムに6自由度の姿勢推定ができる。
- 地面が存在すると仮定してセグメンテーションや特徴抽出を行っている。
- レーベンバーグマーカート法によって抽出した特徴情報からロボットの位置・姿勢推定を行う。

## 処理手順

次の順でSLAMの処理が行われる。

1. セグメンテーションモジュール  
    1スキャン分の点群に対して〇〇する。
2. 特徴抽出モジュール
3. LiDARオドメトリモジュール  
    特徴抽出で得た特徴量を用いて，連続したスキャンに関する座標変換を求める。
4. LiDARマッピングモジュール  
    スキャンした点群を大域的な点群地図に登録する。
5. 座標統合モジュール  
    LiDARオドメトリとLiDARマッピングの結果を融合し，最終的な位置・姿勢推定値を出力する。

## セグメンテーション

- \(P_t = \left\{ p_1,p_2, \ldots , p_n \right\} \)を時刻\(t\)における点群とする。また，ある点\(p_i\)におけるセンサからの距離を\(r_i\)とする。
- 地面が平面であることを仮定しない。
- セグメンテーションの前に，地平面推定処理を行って，地面に相当する点群を取り除く。これによって地面と考えられる点群はラベル付けできたことになる。

- image-gased segmentation methodによって多くのクラスタに分類される。同じクラスタからの点群はユニークなラベルを割り当てられる(ただし，地面だけは特別なクラスタとして分類している)。
- ノイズが大きい環境を仮定すると，葉のような小さな特徴は2回連続してとらえることができず，信頼性の低い特徴量を形成する可能性がある。素早く信頼性のある特徴抽出を実現するために，点の数が30未満のクラスタは無視する。
- 大きめの点群だけ次の処理に使われ，保存される。また，各点群に対して以下の情報を付与する。
    1. 地面かセグメンテーションされたものかのラベル
    2. 範囲画像の行と列番号e
    3. 距離情報

## 特徴抽出

\(S\)をある連続する点群の行成分とする(\(S\)の中心には\(p_i\)が来るものとする。)。\(S\)における点\(p_i\)の粗さは以下で評価できる。

$$
c = \displaystyle \frac{1}{|S| \cdot ||r_i||} || \sum_{j \in S, j = i} ( r_j - r_i ) ||
$$