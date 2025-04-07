# Markdown統合ツール の調査 Quarto

## Meta

[[2025-04-07]][[FSNotes 運用改善]]
#ai #programming #learning

## 概要

Jupyter Notebook みたいなの機能、使用方法、活用事例に関する調査

## 必要なこと

Quarto ためす。

- [x] CLI で実行
  - [x] Zed の tasks で実行したら早い
- [x] iOS で動作 -> FSNotes をそのまま使えばいい？
- [x] 言語実行環境
  - [x] Haskell -> knitr つかった
  - [x] d2で描画
  - [x] 最終的に FSNotes内で可能か？
- [x] タスク管理
  - [x] 基本は Markdown なので。FSNotes と併用可能。（iOS から実行状態を見ることは出来ない）

- [ ] スライドへの変換
	- [ ] Marp と何が違うか？

## 導入

### d2

```
quarto add data-intuitive/quarto-d2
```

### 言語実行

R のインストール
```sh
brew install r
```

Rを起動して以下を実行
```r
install.packages(c("knitr", "rmarkdown"))
```

記述
```
---
title: "Haskell のサンプル"
format: html
engine: knitr
---

```{r setup, include=FALSE}

knitr::knit_engines$set(ghc = function(options) {
  code <- paste(options$code, collapse = '\n')
  f <- tempfile(fileext = ".hs")
  writeLines(code, f)
  out <- system2('runhaskell', f, stdout = TRUE)
  knitr::engine_output(options, code, out)
})

```

サンプル -> /Users/kazuhideoki/dotfiles/hello_haskell.qmd