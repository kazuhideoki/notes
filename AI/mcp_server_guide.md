# MCP サーバーまとめ

## Links

[[AIツールまとめ]]
[[2025-03-06]]
[[2025-03-07]]
[[2025-03-08]]
[[2025-03-10]]

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
