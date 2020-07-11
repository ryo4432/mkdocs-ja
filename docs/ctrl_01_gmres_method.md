# GMRES法

## 概要

非線形モデル予測制御における実時間保証できる計算手法としてC/GMRES法がある。ここではGMRES法についてアルゴリズム手順について整理する。


## 内容

以下の最小二乗問題を考える。ただし，\(A\)は\(m \times n\)の実行列で，\(m \geq n \)と\( m < n \)の両方の場合を考える。

 $$
 \min_{x \in R^n} || b - A x ||_2
 $$

 GMRES法は対象とは限らない正則な行列を係数行列とする連立一次方程式のロバストなクリロフ部分空間法として知られる。\(k\)反復ごとにその時の近似解を初期解としてアルゴリズムを再開する(リスタートする)GMRES(\(k\))法を使うことが多い。これによって反復数の増加に伴うメモリ増加と計算量の膨大を緩和できる。

GMRES法の解法を以下に示す。

1. 初期値\(x_0\)を選択する。
2. \(r_0 = b - A x_0\)を計算する。
3. \(v_1 = \displaystyle \frac{r_0}{||r_0||_2}\)を求める。
4. 次を計算する。ただし，ここでは\(\bar{H}_i = (h_{pq}) \in R^{(i+1) \times i}\)，\(e_i = (1,0,\ldots 0)^{\rm{T}}\)とする。  
    $$
    \begin{align}
    \rm{for}~&i=0,1,2,\ldots k  \\
    &h_{j,i} = ( A v_i, v_j) \ \ (j=1,2, \dots ,i) \\
    &\hat{v}_{i+1} = A v_i - \displaystyle \sum^{i}_{j=1} h_{j,i} v_j \quad (\leftarrow \mbox{グラムシュミットの直行化} ) \\
    %&h_{i+1,i} = ||\hat{v}_{i+1}||_2 \\
    &v_{i+1} = \displaystyle \frac{\hat{v}_{i+1}}{||\hat{v}_{i+1}||_2} \\
    &||r_i||_2 = ||~||r_0||_2 e_i - \bar{H}_i y||_2 \mbox{を最小とするような}y_i \in R^i \mbox{を見つける} \\
    & \quad {\rm{if}}~||r_i||_2 < \epsilon~\rm{then} \\
    & \qquad x_i = x_0 + \left[ v_1, \ldots , v_i \right] y_i \\
    & \qquad \rm{stop} \\
    & \quad \rm{endif} \\
    & \rm{endfor} \\
    & x_0 = x_k \\
    & \mbox{1に戻る}
    \end{align}
    $$

丸め誤差がなければ，\(A \in R^{N \times N}\)が正則な場合はGMRES法は破綻することなく\(N\)回反復以内に連立1次方程式\(Ax = b\)の真の解を与える。