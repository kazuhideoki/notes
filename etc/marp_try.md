# Marp を試す

## Meta

[[2025-03-24]] [[2025-03-25]] [[Claude Code スラッシュコマンド案]]
#learning

## 概要
Marp を試す

### 検証結果

- [ ] ページ番号
- [ ] フッター
- [ ] CSS 最初の一枚(タイトル)
- [ ] 画像
	- [ ] 画像ダンロードを claude でできるようにする -> 現在 python ファイル `/Users/kazuhideoki/dotfiles/marp/images/download_image.py` がある。これを汎用化してスラッシュコマンドでやりたい
- [ ] Claude Code で スラッシュコマンドと組み合わせて作る

## 出力

watch モードで html
```sh
npx @marp-team/marp-cli@latest -w $ZED_FILE -o $ZED_DIRNAME/$ZED_STEM.html --theme-set /Users/kazuhideoki/dotfiles/marp/css/yourstand.html
```

pptx
```sh
npx @marp-team/marp-cli@latest $ZED_FILE -o $ZED_DIRNAME/$ZED_STEM.html --theme-set /Users/kazuhideoki/dotfiles/marp/css/yourstand.pptx
```

## ノート

- まず Marp を有効にする
- 基本CSS を指定する （ --set-themeとかが必要だったり）

```
---
marp: true
theme: yourstand
---
```


- ページング
	- 基本 `---`  で行う
	- `headingDivider: 2` とかで 任意の headingでページングできる
- CSS
	- 個別ページでの設定は `_class` で指定
- 含めないようにするには **コメントアウトしかないみたい**

```
<!-- _class: divider -->

# THE LEADING HEADER
```

- フッター、ページネーション

```
<!-- paginate: true -->
<!-- footer: フッターの文字列です -->
```

- スピーカーノート
	- コメントがそのままスピーカーノートになる。HTML やpptxに対応「PDFだとフラグで別ファイルに生成できる）

```
---
marp: true
---

# スライドのタイトル

スライドの内容

<!-- ここにスピーカーノートを記述 -->
```

