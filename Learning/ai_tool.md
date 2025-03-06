# AIツールまとめ

[[AIコードアシスタント比較（箇条書き形式）]]

## ログによる振り返りについて

- キレのある回答が得られない
	- 目的をもっと絞ったほうがいい。そのために従来の使い方に比べログとプロンプト制限するのはどうか？

## Claude Code

- [ ] 各タスクやプロジェクトでのコストは確認できるのか？

### Claude Dev Container

- `Dockerfile`, `devcontainer.json`, `init-firewall.sh` を設定できたらいけた。
	- https://github.com/anthropics/claude-code/tree/main/.devcontainer
	- [x] 🔶 CLAUDE.md を整える。巷の設定参考に
	- [x] 必要なら `claude  --dangerously-skip-permissions` で立ち上げ前に config を設定したり、フラグを追加して実行する。
	- [ ] ⭐️ `cdev` で任意のディレクトリで実行できるようにした [[2025-03-03]]

### MCP

~/servers 配下で実行。任意の MCP サーバーを build できそう

```
docker build -t mcp/postgres -f src/postgres/Dockerfile .
```

これでアクセスできた

```sh
claude mcp add postgres-server docker -- \
    run -i --rm mcp/postgres \
    "postgresql://postgres:postgres@host.docker.internal:6003/biz_local"
```

🔶 devcontainer では MCP Server につなげない？
- `claude --dangerously-skip-permissions` 直前に ip を付与 & そのip を init-firewallで除外設定する？？

## 生成AIの活用半年先まで

- 目標
	- Agentic な開発ができる組織にする。比較的単純なコーディングを素早くこなせるようにし生産性向上、そしてより大切な部分に時間を割けるようにする
	- 目安は半年後に開発タスク量は2倍こなせる
- フォローはするので
- 個人に対する評価方法
	- 評価は日々のタスク量+生成AI勉強会でのアウトプット
	- 評価結果であがりもするし下りもする

## AI関連開発費用

- ChatGPT: 月3000 or 3万 
- 自由に使えるもの: 一人1万円/月 -> 6人なら 月6万

- どのように決めるか？
	- リテラシーによってある程度振り分ける。現在の利用により各々のキャップを決める(作業、相談、学習など)
	- 利用状況や勉強会でのアプトプットを評価し、随時予算振り分け再考

