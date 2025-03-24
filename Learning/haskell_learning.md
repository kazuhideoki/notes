# Haskell Learning

## Links
- [[2025-03-19]]
- [[haskell_exploration]]

## 概要
Haskell プログラミング言語の学習ノート

---

## MEMO

標準入力を受け取る
```haskell
line1 <- getLine
```

read パースする
words スペース区切りの文字列を配列にする
```haskell
let numbers1 = map read (words line1) :: [Int]
```
 
`init` 末尾を除いたすべて
`tail` 先頭を除いたすべて
```haskell
init (tail chars) -- 先頭と末尾を除いた中間部分
```

---

`putStrLn` 文字列を出力。print だとダブルクォートもついてしまう
```
putStrLn result
```

`all` 全ての条件が真になるかどうか。js の every みたいな
```haskell
all (== "=") middle
```

`map [関数] [配列]` ここでは標準入力をスペース区切りで分割したものを Int にパースしている
```haskell
let intList = map read (words line) :: [Int]
```

---

`fromEnum` 真偽値を 0/1 の整数に変換
```
if sum (map fromEnum conditions) == 2
```

`splitAt :: forall a. Int -> [a] -> ([a], [a])`
配列を index で分離する
```
let (before, rest) = splitAt i xs
```

`drop :: forall a. Int -> [a] -> [a]`
リストを指定した index 以降を残し、前半をなくす
```haskell
after = drop 2 rest
```

---

`findIndex`
`elemIndex`
```haskell
findIndex (== answer) answers

elemIndex answer answers
```

