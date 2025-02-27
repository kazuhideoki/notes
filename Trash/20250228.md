# 2025-02-27

## 本日のタスク

- [x] SQL 理解と立ち合い https://yourstand.backlog.com/view/PDM_S-1757
- [x] DTO 対応レビュー依頼 https://github.com/yourStand/yourstand-console/pull/2622#issuecomment-2681300347
- [x] 📝 医療系のとこ 履歴書、業務経歴（ポートフォリオ的なもの）提出

- [x] 生成AI関連調査、提案 https://yourstand-ev.slack.com/archives/C07E024TUGN/p1740038270850759

- [x] Raycast の AI Extension のキャッチアップ https://manual.raycast.com/ai-extensions
Raycast の AI Extention すごかった。Github, Slack, Calendar とか結構使える。

## 明日のタスク

- [ ] Entity の扱いについて共有と相談
- [ ] YS4Bリポジトリ分割, デプロイqq

## 積み上げタスク

### 🔵 Yourstand

- [ ] Findy+ の件相談(出社時)

### 🔴 dotfiles

- [ ] Dailyのフォーマット決定
- [ ] Dailyの当日のファイル作成時に前日のものを参考に整形

- [ ] any_log git_logリモートのログを取得できるように修正 PR やコメント
- [ ] any_log slack_log 自分の投稿が含まれているもののみにフィルターする
- [ ] any_log slack_log 複数チャンネル対応

### ⭐️ Private

- [ ] zed ポートフォワード バージョン175で
- [ ] Claude Code コンピューターUSE は使えるか？ -> https://github.com/anthropics/anthropic-quickstarts/tree/main/computer-use-demo

## メモ

### YS4B リポジトリ分離

@app/ocpp-base が解決できない

- [x] libs 廃止で slack/sendgrid 取り込みは？

ocpp-base 側で entryPoint を dist/src/index.js にする + import {...} from "ocpp-base" でうまくいった

### 生成AI 勉強会

#### 発表内容

- o1 pro + Devin 使って議事録 -> Backlog
	- genai でシェアしたスレッド見せる
	- それを元に説明
- Claude Code
	- 軽い説明 -> ChatGPTにさせる
	- 実際にタスクやらせてみる 
		- [ ] 🔶どんなタスクにしよう？

- PDF作成できるのには驚いた