# 圏の定義の YAML

圏のアイデアを圏としてもっともらしく定義するための YAML の記述方法について

- それぞれの項目に対してシンプルにどのような値になるか定義する
  - なるべく数学的に厳密に定義できる場合のみ記述して。定義できない場合は null とする
- それに対して具体的なを説明を入れる。
- 具体的な例がある場合、列挙する。

## フォーマット

```yaml
〇〇の圏:
  対象:
    値:
    説明:
    例:
  射:
    値:
    説明:
    例:
  恒等射:
    値:
    説明:
    例:
  合成:
    値:
    説明:
    例:
  モノ射:
    値:
    説明:
    例:
  エピ射:
    値:
    説明:
    例:
  始対象:
    値:
    説明:
    例:
  終対象:
    値:
    説明:
    例:
  積:
    値:
    説明:
    例:
  余積:
    値:
    説明:
    例:
```

## 例

```yaml
電車ネットワークの圏:
  対象:
    値: 駅
    説明: 電車のネットワークにおける駅を表す点
    例:
      - 東京駅
      - 新宿駅
      - 渋谷駅
  射:
    値: 駅間の移動
    説明: 始点の駅から終点の駅への直接の電車移動
    例:
      - 東京駅から新宿駅への山手線
      - 渋谷駅から新宿駅への山手線
  恒等射:
    値: その駅に止まること
    説明: 同じ駅にとどまる操作（実質的な移動なし）
    例:
      - 東京駅での乗り換え待ち
  合成:
    値: 連続的な移動
    説明: 駅Aから駅Bへの移動と駅Bから駅Cへの移動を合成して、駅Aから駅Cへの移動となる
    例:
      - (東京→新宿)と(新宿→渋谷)の合成で(東京→渋谷)の移動が得られる
  モノ射:
    値: 単一路線での移動
    説明: 他の移動方法が存在しない一意的な駅間移動
    例:
      - 特定の地方路線で繋がる駅間の移動
  エピ射:
    値: 全ての行き先をカバーする移動
    説明: 始点から可能なすべての終点にたどり着ける移動の集合
    例:
      - ターミナル駅からの各方面への移動
  始対象:
    値: 起点となる駅
    説明: ネットワーク上で多くの路線の起点となる駅
    例:
      - 東京駅（多くの路線の起点）
  終対象:
    値: 終着駅
    説明: 多くの路線の終点となる駅
    例:
      - 終着駅（複数の路線の終点）
  積:
    値: 複数の駅に共通してアクセスできる駅
    説明: 複数の目的地に効率よくアクセスできる乗換駅
    例:
      - 新宿駅（JR、私鉄、地下鉄の乗換駅）
  余積:
    値: 複数の起点から到達できる駅
    説明: 異なる出発点から到達可能な合流地点となる駅
    例:
      - 秋葉原駅（JR、地下鉄など複数の路線が合流）
```
