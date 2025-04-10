# Playwright 検証

## Meta

[[2025-03-28]]
#ai

## 概要

Playwright を使用した自動テスト検証に関するメモ
MCP Server で連携する

## mcp add

```sh
claude mcp add playwright npx -- -y @executeautomation/playwright-mcp-server
```

## 指示プロンプト

```
EV充電の法人向け予約管理コンソールで予約をして欲しい。
playwright を使って

## ログイン情報

- メールアドレス: `cedar123pc@gmail.com`
- パスワード: `WdqDx1cTeZBUQ1jwPlO8`

## URL 

`http://localhost:3003/`

## 対象

()はページへの遷移方法

- 企業: `会社1` (企業選択画面orダッシュボードの左上の企業)
- 施設: `施設1` (サイドバーから選択)
- エリア: `エリア名 1` 施設 (施設画面でエリア選択可能)
- スペース: `hoge2`

## 予約

- 予約ダイアログを開く方法
  - ページ: 駐車エリアの予約タブ
  - クリック場所: カレンダーで、該当スペース行において現在時刻(青い縦線)より後のセル
- 予約内容
  - 利用種別: 充電
  - 予約時間: 時間指定
  - 開始時間: 3月28日 20:00
  - 終了時間: 3月28日 21:15
  - 繰り返ししない
  - 充電出力: 1.2
  - 利用者: oki
  - 利用車: なし
```

## 結果



- ログインからやると予約カレンダーまで辿り着かなかった
- 予約カレンダーからやっても正しく内容を入力できなかった

## 結果2

https://github.com/microsoft/playwright-mcp

まあまあの成功、しかし予約カレンダーのクリックで失敗することがおおい。

```
EV充電の法人向け予約管理コンソールで予約をして欲しい。
playwright を使って

## ログイン情報

- メールアドレス: `cedar123pc@gmail.com`
- パスワード: `***`

## URL 

`http://localhost:3003/`

## 対象

()はページへの遷移方法

- 企業: `会社1` (企業選択画面orダッシュボードの左上の企業)
- 施設: `施設1` (サイドバーから選択)
- エリア: `エリア名 1` 施設 (施設画面でエリア選択可能)
- スペース: `スペース 735339`

## 予約

- 予約ダイアログを開く方法
  - ページ: 駐車エリアの予約タブ
  - クリック場所: 駐車エリアの予約タブは横スクロール形式のカレンダーとなっている。各行はスペース、各列は時間を表している。対象スペースの行を直接クリックすることで予約ダイアログが表示される。
- 予約内容
  - 利用種別: 充電
  - 予約時間: 時間指定
  - 開始時間: 3月29日 14:00
  - 終了時間: 3月29日 15:15
  - 繰り返ししない
  - 充電出力: 1.2
  - 利用者: oki
  - 利用車: なし
```

```
カレンダーセルのクリックが失敗している主な理由は:

  1. セル要素が適切にタグ付けされていない - アクセシビリティスナップショットでセルが個別の要素として認識されず、単一のテキスト要素としてレンダリングされている
  2. 要素参照の欠如 - カレンダーグリッドのセルに個別の参照ID (ref=xxxx) がない
  3. インタラクティブ要素としての認識不足 - セルがボタンやリンクなどのインタラクティブ要素として適切にマークアップされていない
  4. コンテンツの構造化不足 - カレンダーがアクセシビリティを考慮した方法で構造化されておらず、スクリーンリーダーやPlaywrightなどの自動化ツールが正しく認識できない

  これらの理由により、Playwrightがセルを個別のクリック可能な要素として識別できず、予約ダイアログを開くことができません。
```

