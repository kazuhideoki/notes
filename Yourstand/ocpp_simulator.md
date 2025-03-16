# OCPP充電器シミュレーター 開発メモ

## Version 0.4.0

### 機能追加・改善

- **CallError型の対応**
  - 型定義
  - バリデーション追加
- **継続的接続リトライ**
  - 5回までリトライを実装
- **ChangeConfiguration 対応**
  - `heartbeatInterval` 設定に対応済
- **ClientContext表示改善**
  - 必要な情報のみ表示（コマンド `con` で表示可能）
- **不要なClientContextの自動削除**
  - cronによる古いコンテキストの自動削除
  - 5分間応答がない場合に削除
  - 削除対象: `serverProcessingMessages`
- **関数をclass化して整理**
  - DI（依存性注入）パッケージを利用
  - `interface -> handler -> service` の構造で実装
  - Loggerの導入準備
  - 移行対象:
    - Heartbeat（初期実装済）
    - MeterValues（アプリケーション・テスト含む）
      - 🔶ClientContext生成方法の検討（直渡し or モック？）
- **ログレベルの切り替え**
  - validationをdebugレベルに切り替える
- **テストの修正**
  - DIに対応したテストの修正
- **ClientContext内容の完全なファイル保存化**

## Version 0.5.0

### 🔵 完了済タスク

#### 機能

- **実際のハードウェア状態に応じた挙動制御**
  - StatusNotification送信時に状態バリデーション
    - トランザクション中は`Preparing`送信不可
    - `Available`送信（プラグアウト）時にトランザクション終了処理
  - 充電開始・終了時バリデーション
  - chargeEquipmentStateの更新タイミングを制御
    - 起動時、充電開始/終了時に更新
    - 状態変更をStatusNotificationServiceで統一管理（plug/charge/operational）
  - 🔶問題点
    - `lastStatus`が未保存（再接続時に`Available`および`isCharging`が消失）
- **ChangeConfigurationのバリデーション対応（担当: Devin）**
  - meter系4項目のvalidationをzodで実装

#### リファクタリング

- 各アクションごとにファイル保存処理を修正
  - 状態変更のたびに即時保存

#### その他改善

- CIの導入（担当: Devin）
- 任意タイミングでMeterValues送信（担当: Devin）
  - デフォルト間隔に関係なく送信可能に改善
- fast-check導入
  - `user-input-handler`での利用
- 各サービス仕様・責務の明確化（JSDocで記述）
  - フォーマットは要検討、試験的に追加
- データの直接修正機能追加（ChangeConfiguration未使用、担当: Devin）
- ADR（Architecture Decision Record）の追加
  - ディレクトリ直下の説明文
  - 設計を視覚的に理解できる図の追加
- 充電量の正確な差分計算（diffmillを利用）
  - 1分間隔に依存せず正確な数値を計算

### 🔴 0.5.0リリース前の必須タスク

- MeterValueSampleIntervalとClockAlignedDataIntervalの初期値（規定値）へのリセット（現在値は60）

### 後続タスク

#### データ管理

- データ閲覧・更新・リセット機能
  - 更新時のバリデーションはzodで実施
  - CLI経由でデータ操作可能にする
- ログ管理の改善（file-managerで実装）

#### 充電器モデル別挙動の変更

- StatusNotificationの内容調整
- 接続時送信内容のモデル別対応
- MessageIdの管理
- 終了時、StopTransactionとStatusNotification（Finishing）の送信順序検討

#### その他

- GetConfiguration対応
- 各アクション別Validation Error表示改善
  - Call/CallResult/CallErrorでエラー処理を分離
  - 分岐後の個別PDU単位でバリデーションを実施

## 検討課題

- debugログに含める内容の再検討

## リリース時の問題

- README記載のcurlコマンドでHTML取得問題発生
  - 一時対応としてはcloneで対応推奨
  - 他のリリース方法を検討する
