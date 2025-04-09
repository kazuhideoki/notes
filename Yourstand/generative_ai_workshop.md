---
marp: true
theme: yourstand
headingDivider: 2
---

# 2025-04-10 生成AI勉強会

<!-- _class: divider -->

<!-- ## Meta

[[2025-04-09]][[2025-04-10]]
#ai #meeting -->

## 目次

- エージェント利用での失敗
- 作成した MCP Server

# エージェント利用での失敗

<!-- _class: divider -->

## リファクタリングの失敗

### 1. 指示

```
〇〇のファイルのフォーマットに従って ××のファイルを修正してください
```

### 2. 結果

勝手に内容を変えられた

```yaml
substitutions:
  _DD_ENV: development
  _DEPLOY_REGION: asia-northeast1
  _TRIGGER_ID: 3dd80d2a-dc82-49e4-9a86-cd5e7998e724
```

## git 操作の失敗

### 1. 指示

```
先ほどの修正を revert してあらたに 〇〇してください
```

### 2. 結果

エージェント変更前のユーザーの変更分も revert された

### 3. 考えられる原因

- 「先ほど」という指示が曖昧で、ユーザーとエージェントの修正部分が不明確だったため
- `git add` や `git commit` の操作が許可なしで実行可能だった

### 4. 回避策

- コミットハッシュや「1つ前の」など明確に指示する
- git 操作の時はユーザーの許可を必ず必要にする

# 作成した MCP Server

<!-- _class: divider -->

## Google Calendar

## Google Logging
