# 圏論アイデア

## Meta

[[プログラマーのための圏論]]
#learning #category 

## 概要

圏論の学習に関するメモ
アイデアや方向性をメモする

## 圏論の学習の目的~方法

- Why【最終目的】
	- 「考える力」をつけたいと考えている。
- What 圏論を使って成し遂げたいこと
	- 日常のいろんな概念を圏論で表現して整理分析ができる
- How どうやってそれをトレーニングするのか？
	- 【1】ある概念を圏で表現することができる
		- yaml で圏の表現をする。定義(対象、射、ドメイン/コドメイン、恒等射/単位律、合成/結合律)
		- Haskell に落とし込む
	- 【2-a】よくある数学の圏を学ぶ
	- 【2-b】概念同士の比較や変換ができる
		- 関手や自然変換を扱う

## 圏論の基礎概念を学ぶ

- 射の合成
- 恒等射
- モノ射エピ射
- 始対象 終対象 双対
- 積 余積
- 関手
- 自然変換

## よくある圏で基礎概念を理解する

- 集合
- 順序
- モノイド
- 群
- ベクトル空間
- グラフ

以下のフォーマットで表現してみるとか

![](i/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202025-04-03%206.48.57.png)

```yaml
あみだくじの圏:
  対象:
    - シングルトン
  射:
    - p0
    - p1
    - p2
    - p3
    - p4
    - p5
  ドメイン: シングルトン
  コドメイン: シングルトン
  恒等射: p0
  合成: 置換行列の接続
  結合律: 満足
  単位律: 満足
```

## Haskell で表現してみる

上記フォーマットをコード化
```haskell
data Object = Singleton deriving (Show, Eq)

data Morphism = P0 | P1 | P2 | P3 | P4 | P5 deriving (Show, Eq)

data Category = Category
  { objects       :: [Object]       -- 対象
  , morphisms     :: [Morphism]     -- 射
  , domain        :: Morphism -> Object    -- ドメイン
  , codomain      :: Morphism -> Object    -- コドメイン
  , identity      :: Object -> Morphism    -- 恒等射
  , composition   :: Morphism -> Morphism -> Morphism  -- 合成
  , associativity :: Bool           -- 結合律: 満足なら True
  , identityLaw   :: Bool           -- 単位律: 満足なら True
  }

amidakujiCategory :: Category
amidakujiCategory = Category
  { objects       = [Singleton]
  , morphisms     = [P0, P1, P2, P3, P4, P5]
  , domain        = const Singleton
  , codomain      = const Singleton
  , identity      = const P0
  , composition   = \m1 m2 -> if m1 == P0 then m2 else m1
  , associativity = True
  , identityLaw   = True
  }
```

```haskell
{-# LANGUAGE InstanceSigs #-}

import Prelude hiding ((.), id)
import Control.Category

-- 射を表す型。全体は Singleton じゃけぇ、対象は型パラメータで表すだけじゃ。
data Amida = P0 | P1 | P2 | P3 | P4 | P5
  deriving (Show, Eq)

-- 全ての対象は同じと仮定して、型引数は実体を持たんけぇ、phantom 型にしとるんよ。
newtype AmidaCat a b = AmidaCat { runAmidaCat :: Amida }
  deriving (Show, Eq)

instance Category AmidaCat where
  id :: AmidaCat a a
  id = AmidaCat P0

  (.) :: AmidaCat b c -> AmidaCat a b -> AmidaCat a c
  (AmidaCat f) . (AmidaCat g) =
    -- ここでは合成を単純に定義しとるけぇ、P0 なら後者を、そうでなければ前者を返す例じゃ。
    if f == P0 then AmidaCat g else AmidaCat f

-- 使用例
example1 :: AmidaCat () ()
example1 = id

example2 :: AmidaCat () ()
example2 = (AmidaCat P1) . (AmidaCat P2)
```
