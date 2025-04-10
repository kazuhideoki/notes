---
marp: true
theme: yourstand
headingDivider: 2
style: |
  .columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
  .toc-item {
    font-size: 1.8em;
    font-weight: bold;
    margin: 0.8em 0;
    color: #0078d4;
  }
---

# 2025-04-10 生成AI勉強会

<!-- _class: divider -->

<!-- ## Meta

[[2025-04-09]][[2025-04-10]]
#ai #meeting -->

## 目次

<div class="toc-item">🤖 エージェント利用での失敗</div>

<div class="toc-item">🔌 新たに使い始めた MCP Server</div>

# エージェント利用での失敗

<!-- _class: divider -->

## リファクタリングの失敗

### 1. 指示

```
〇〇のファイルのフォーマットに従って ××のファイルを修正してください
```

### 2. 結果

<!-- 画像を右側に配置 -->
<div class="columns">
<div>

**勝手に内容を変えられてしまった。**

</div>
<div>

![width:500px](i/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202025-04-09%2016.21.50.png)

</div>
</div>

### 3. 原因、回避策

エージェントの修正後のファイルチェックが甘かった（巷で言う目gerp）
チェックのしどころを見極めながらやる

## git 操作の失敗

### 1. 指示

```
先ほどの修正を revert してあらたに 〇〇してください
```

### 2. 結果

**エージェント変更前のユーザーの変更分も revert された**

### 3. 考えられる原因

- 「先ほど」という指示が曖昧で、ユーザーとエージェントの修正部分が不明確だったため
- `git add` や `git commit` の操作が許可なしで実行可能だった

### 4. 回避策

- コミットハッシュや「1つ前の」など明確に指示する
- git 操作の時はユーザーの許可を必ず必要にする

# 新たに使い始めた MCP Server

<!-- _class: divider -->

## Google Calendar

### リポジトリ

https://github.com/nspady/google-calendar-mcp

### 用途

```
明日の予定を教えて
```

```
〇〇さんと××さんと来週の月曜日から隔週2日で午前10時のミーティングを入れておいて
```

```
明日の〜のミーティング、大会議室を予約して。空いてなかったら他のやつで
```

slack と連携したりとかも

```
先ほど times_oki で〜について話していた件、Google Calendar でミーティング予定入れといて
```

## Google Logging

### リポジトリ(自作)

https://github.com/kazuhideoki/mcp-server-google-logging

### 機能

- **gcloud logging read をラップしたもの**
- コンテキスト節約のためにフィルターする -> それでもクエリによってはログ量が多い。課題
- ドメイン知識(管理コンソールやOCPPについて)の情報を得られる -> YS特化型みたいな。分離も案

### 用途

```
充電器 `wallbox_PulsarPlus_XXXXXX` が昨日切断されたり利用不可能だった時間帯はある？
```

DBアクセスと連携

```
ユーザーの〇〇さんが機能充電に失敗した。その原因は何？
```
