# Marp を試す

## Links
- [[2025-03-24]]
- [[2025-03-25]]

## 概要
Marp を試す

### 検証結果
- [x] 1ページしか出力されない
  - [x] - `---` で区切ればページングできる
- [x] 生成物を Google Slide に読み込むと画像になる - 画像でいい。Markdown 側で編集すればいいので
- [x] テーマを編集する
	- ページごとは `<!-- _class: yourstand-divider -->` みたいにするとOK
- [ ] ページ番号
- [ ] フッター
- [x] テーマを YS っぽくする
	- [x] 背景やdivider
	- [ ] 最初の一枚(タイトル)
- [ ] 画像
	- [ ] 画像ダンロードを claude でできるようにする -> 現在 python ファイル `/Users/kazuhideoki/dotfiles/marp/images/download_image.py` がある。これを汎用化してスラッシュコマンドでやりたい
	- [x] Marp で画像表示を試す
	- https://marpit.marp.app/image-syntax に記述方法がある。自由度はそれなりだが、ざっくりした配置になってしまう
- [ ] Marp doc をローカルに落としておいて、claude code が参照できるようにする
