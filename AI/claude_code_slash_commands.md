# Claude Code スラッシュコマンド案

## Links

[[AIツールまとめ]] 
[[2025-03-25]]
[[2025-03-26]]
[[OpenAI Text to Speech]]
[[Marp を試す]]

## 概要

Claude Code で利用可能なスラッシュコマンドの検討案
それに付随して、Claude Code でさまざまなタスクをうまく行う方法の模索

## d2 検証

- [ ] 生成物を puppeteer などで画像を検証できるか？ -> 構成が妥当かどうか？

## Marp 検証

- [ ] スラッシュコマンド
	- [ ] CSSの指定がない時は聞き返す
	- [ ] Yourstand CSSの時は典型的なフォーマットのサンプルを示す
	- [ ] 画像取得に対応
	- [ ] バックグラウンド watchで実行
- [ ] 生成物を puppeteer などで画像を検証できるか？ -> 構成が妥当かどうか？

## pptx to video

- pptx を用意する
	- スピーカーノートがある。
- スピーカーノートを OpenAI の APIで音声化する
- 各音声ファイルと pptx を合成して動画にする
	- 音声ファイルの長さをpptxの各ページの長さに対応させていく

## 全体設計 (MCP Serverなど)

メディア関連を扱いたい？

- スクリプト -> **単一機能の提供** 単体実行できること & MCP Server に取り込めること
	- [x] - Web から画像取得 -> 
	- [x] - openai.fm でテキストから音声ファイル作る https://platform.openai.com/docs/guides/text-to-speech?lang=curl
	- [ ] - openai で画像を生成させる (🔶 4o の新しい画像生成APIはまだない4/26 `Developers will soon be able to generate images with GPT‑4o via the API, with access rolling out in the next few weeks.` )
	- [ ] - pptx(pdf) と音声ファイルを合成してスライド動画を作成する
- MCP Serverqw
	- メディア関連を扱うので良いか？
- 普通にエージェントで行う -> **作成/編集する時。指示しながらやらせる**
	- MCPでラップしたスクリプトを呼ぶことが可能
- スラッシュコマンド -> **エージェントで特定の提携作業を効率的に行わせる** 提携のプロンプトを用意し、スクリプトやMCP Server と連携してタスクを進める
	- [x] - d2 で作図補助 (watch モード + ドキュメント参照)
	- Marp でスライド作成補助 (watch モード + ドキュメント参照 + ある程度のテンプレートに対応)
