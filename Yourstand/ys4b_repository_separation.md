# YS4B リポジトリ分離

- 必要なこと
	- Github Secret Key の追加 -> biz-dev-github-ssh 
	- cloudbuild.yaml を作成
	- トリガーの作成
		- 参照リポジトリ変更
		- タグルール変更
		- cloudbuild.yaml の参照先変更
		- フロントもリポジトリの cloudbuild.yaml 参照に。

## References

[[2025-03-03]]