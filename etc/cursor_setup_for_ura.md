# Cursor 環境構築 (Ura-san向け)

## Meta

[[非開発者向け MCP サーバー連携環境構築について]] [[2025-04-07]]
#ai #programming #mcp

## 概要

浦さん向けのCursor環境構築と、MCP連携の手順

## 手順

- [x] Cursor ダウンロード、利用可能な状態にする
- [x] MCP 連携する -> json で

## ツール別連携まとめ

0. まず brew が入っているか？
1. `git` `docker` `node` あたりが必要になる

注: シークレットの類を保存する時は `.gitignore` に加えておく

### brave_search

1. `git` と `docker` が必要
2. clone する -> https://github.com/modelcontextprotocol/servers
3. https://brave.com/search/api/ でサインアップして API を取得する
4. .mcp.json に設定を記述
```json
"brave_search": {
  "command": "docker",
  "args": [
    "run",
    "-i",
    "--rm",
    "-e",
    "BRAVE_API_KEY={api_key}",
    "mcp/brave-search"
  ]
}
```

### fetch

### slack

1. `git` と `docker` が必要
2. clone する -> https://github.com/modelcontextprotocol/servers
3. Slack で操作対象のチャンネルに `YS Slack MCP Server` を参加させる
4. .mcp.json に設定を記述 -> https://yourstand-ev.slack.com/archives/D0257LA2BGD/p1743588124462899?thread_ts=1743583620.243979&cid=D0257LA2BGD
```json
"slack": {
  "command": "docker",
  "args": [
    "run",
    "-i",
    "--rm",
    "-e",
    "SLACK_BOT_TOKEN={todo}",
    "-e",
    "SLACK_TEAM_ID=TT4HAERQR",
    "mcp/slack"
  ]
}
```

### gcal

1. `git` と `node` が必要
2. clone する -> https://github.com/nspady/google-calendar-mcp
3. クレデンシャル配置 `gcp-oauth.keys.json`
4. OAuthで認証する `npm run auth`
5. buildする `npm run build`
6. .mcp.json に設定を記述
```
"gcal": {
  "command": "node",
  "args": ["/path/to/google-calendar-mcp/build/index.js"]
}
```

### gdrive