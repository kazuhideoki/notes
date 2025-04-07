# Markdown統合ツール の調査

## Meta

[[2025-04-07]]
#ai #programming #learning

## 概要

Jupyter Notebook みたいなの機能、使用方法、活用事例に関する調査

## 必要なこと

Quarto ためす。

- [ ] CLI で実行
	- [ ] d2 や Marp みたいに利用可能
	- [ ] 
- [ ] iOS で動作 -> FSNotes をそのまま使えばいい？
- [ ] 言語実行環境
  - [ ] Haskell
  - [x] d2 やそれに変わる図表描画 -> https://graphviz.org/about/ とか
- [x] タスク管理
	- [ ] 基本は Markdown なので。FSNotes と併用可能。（iOS から実行状態を見ることは出来ない）

## 導入

d2 はできた、Haskell がうまくいかない。jutyter の kernel でうまくいかない。

```
quarto preview '/Users/kazuhideoki/Library/Mobile Documents/iCloud~co~fluder~fsnotes/Documents/hello.qmd'

Starting haskell kernel...ERROR:

path
```