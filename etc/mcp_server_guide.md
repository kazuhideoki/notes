# MCP サーバーまとめ

## Meta

[[AIツールまとめ]] [[2025-03-06]] [[2025-03-07]] [[2025-03-08]] [[2025-03-10]] [[2025-03-13]] [[2025-03-28]]
#ai

## 自作方法

https://github.com/modelcontextprotocol/typescript-sdk を使えばサーバーやクライアントを簡単に生成できそう。

- stdio でローカル環境で CLI 連携できる
- HTTP with SSE でサーバーを立ち上げられる
- クライアントは HTTP with SSE のサーバーに対して接続するイメージ

### Backlog 連携

- [ ] Backlog 連携は可能か？

## 公式 MCP Servers

`~/servers` のもの。
https://github.com/modelcontextprotocol/servers

### 基本情報

~/servers 配下で実行。任意の MCP サーバーを build できる

```
docker build -t mcp/postgres -f src/postgres/Dockerfile .
```

### 接続方法

以下のコマンドでアクセス可能：

```sh
claude mcp add postgres-server docker -- \
    run -i --rm mcp/postgres \
    "postgresql://postgres:postgres@host.docker.internal:6003/biz_local"
```

### 課題と解決方法

#### devcontainer での MCP Server 接続

🔶 devcontainer では MCP Server につなげない問題

- 解決策: `claude --dangerously-skip-permissions` 直前に IP を付与し、その IP を init-firewall で除外設定する。 -> 難しい

2025-03-10 -> [Delete Project User](https://developer.nulab.com/docs/backlog/api/2/delete-project-user/) までやった

### 残タスク

- [ ] 共通 MCP サーバー連携設定 -> .mcp.json
- [ ] backlog改善→ MCPの作り方に合っているか？

#### 個別MCPサーバー対応

- [x] Slack -> Slack App が必要
	- [ ] よく使うチャンネルIDは登録しておく -> チャンネル一覧などの検索をスキップしてトークン節約に寄与 -> home がいいか？
- [x] Google drive -> これも OAuth が必要
	- [x] 🔶 src/gdrive/README.md を見てやったが、接続できない。取得したクレデンシャルで curl したらうまくいった。
- [x] カレンダー（Google/Apple）-> GCP でアプリか何か作成する必要がある(calendar-notice みたいな)
- [ ] GitHub Action
- [ ] Gmail -> OAuth GCP でアプリか何か作成する必要がある
- [x] Apple -> あまり使えなかった
- [ ] Quick chart（グラフ作成）
- [ ] メモリーバンク（あったっけ？）
- [ ] GitHub公式MCPサーバー

自作

- [ ] 最近のアクティビティを取得とか（any log+ FSNote からとればいいか？）
- [ ] GCP Logging -> gcloud でできた
	- gcloud logging read 仕様 https://cloud.google.com/sdk/gcloud/reference/logging/read
![](i/cb17f758-6141-4a70-a8fb-c8c1fdeff1d7.jpg) Datadog
- [ ] 画像解析 -> 既存サービスと連携して解析する MCP Server

## .mcp.json

```

{
  "mcpServers": {
    "brave_search": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "BRAVE_API_KEY=BSAkTGSrV4eBMCfRIWRShDjOGd0s2o0",
        "mcp/brave-search"
      ]
    },
    "backlog": {
      "command": "node",
      "args": [
        "/Users/kazuhideoki/mcp-server-backlog/dist/index.js",
        "--permission",
        "MUTATE"
      ]
    },
    "fetch": {
      "command": "docker",
      "args": ["run", "-i", "--rm", "mcp/fetch"]
    },
    "slack": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "SLACK_BOT_TOKEN=xoxb-hoge",
        "-e",
        "SLACK_TEAM_ID=TT4HAERQR",
        "mcp/slack"
      ]
    },
    "gcal": {
      "command": "node",
      "args": ["/Users/kazuhideoki/google-calendar-mcp/build/index.js"]
    },
    "gdrive": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-gdrive"]
    }
  }
}

```
