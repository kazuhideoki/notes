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

---
サンプル -> /Users/kazuhideoki/dotfiles/hello_haskell.qmd
以下 qmd の記述
```
---
title: "Haskell のサンプル"
format:
  html:
    highlight-style: github
engine: knitr
filters:
  - d2
d2:
  layout: elk
  theme: "NeutralDefault"
---

## たのしい！ Quarto

```{r setup, include=FALSE}
knitr::knit_engines$set(ghc = function(options) {
  code <- paste(options$code, collapse = '\n')
  f <- tempfile(fileext = ".hs")
  writeLines(code, f)
  out <- system2('runhaskell', f, stdout = TRUE)
  knitr::engine_output(options, code, out)
})
```

```{r}
#| echo: false
#| engine: ghc
main :: IO ()
main = putStrLn ("Hello, Haskell from Quarto!" ++ fuga)

fuga = "fuga"
```

## 外部Haskellファイル

```{r}
#| echo: false
#| results: asis
haskell_file <- "external.hs"

# ファイルの内容を読み込む
file_content <- readLines(haskell_file)

# ファイルの内容をMarkdown形式で出力
output <- c("```haskell", file_content, "```")
knitr::asis_output(paste(output, collapse = "\n"))
```

## 実行結果

```{r}
#| echo: false
# 外部Haskellファイルのパスを指定
haskell_file <- "external.hs"

# 外部Haskellファイルを実行して結果を取得
result <- system2('runhaskell', haskell_file, stdout = TRUE)

# 結果を表示
cat(result, sep = "\n")
```

```{.d2}
direction: right
x -> y -> z
```

---