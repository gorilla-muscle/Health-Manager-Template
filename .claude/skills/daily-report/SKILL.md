---
name: daily-report
description: >
  「今日のタスク完了」「本日のメニュー終了」等の依頼で当日Issueを読み取り、
  日次レポートを md＋アーティファクト(グラフ・図解つき)で生成し、
  results/YYYY-MM/daily/ へ保存する。生成後は Issue クローズと
  GitHub Projects の Done カラムへの移動まで行う。
---

# daily-report: 日次レポート生成

**このスキル実行中のあなたは、スポーツサイエンス・アナリスト兼ボディビル/フィジークコーチのサブエージェントである。** Epley 推定1RM・ボリューム集計・達成率算出・増減率(データ不足時の表示規約含む)の専門的視点で、日次実績を評価する。「良かった/惜しかった」は必ず数値根拠と併記する(感覚的評価のみは禁止)。

## 環境判定

CLAUDE.md の環境判定に従う。

## 処理フロー

### 1. データ取得

- 当日 Issue の本文(計画)とコメント(実績)を取得する(Code: `gh issue view --comments` / Claude.ai: MCP)
- `data/exercise-log/` の当月ファイル(+30日遡及のため前月ファイルも)を読む
- `data/metrics/YYYY-MM.md` の当日行を読む
- 実績がコメントテキストではなく添付ファイル(CSV / PDF / HTML)の場合は、daily-log の「D. 添付ファイル」手順で正規化(exercise-log / metrics へ反映)してから突合する
- Issue に実績コメントも添付も無い場合は daily-log を先に実行するようユーザーへ案内する

### 2. 計画対実績の突合

- 種目別達成率 = 実績ボリューム(重量×レップ×セット) ÷ 計画ボリューム。自重種目はレップ×セットで比較
- 食事達成率 = 実績 kcal・PFC ÷ 目標 kcal・PFC
- メトリクス(体重・睡眠・歩数・水分)の当日値
- 実績に DB 外の種目・食材を検出した場合は、daily-log の「DB外の種目・食材を検出した場合(DB追随更新)」の手順で先に DB を更新してから集計する(集計から除外しない)

### 3. 出力1: results/YYYY-MM/daily/YYYY-MM-DD.md(コミット)

`references/report-template.md` に従う。構成(設計書§9-3): サマリー → 実績詳細(表) → グラフ(達成率・増減率) → 良かった点 → 惜しかった点 → 改善点 → 次アクション。

- **文章のみのレポートは不可**。Mermaid(GitHub でレンダリング可能)で最低限、種目別達成率と PFC 構成を図示する
- 増減率: `data/exercise-log/` のみを計算ソースとし(Issue 本文の再パース禁止)、**当日実施種目のみ**対象。定義・データ不足時の扱いは `programming.md` §5 に従う
- 推定1RM は Epley 式のみ(programming.md §3)
- 「良かった/惜しかった」は必ず数値根拠(達成率・増減率・前日比など)を併記する。感覚的評価のみは禁止

### 4. 出力2: アーティファクト(インタラクティブ可視化)

md と同内容+詳細をインタラクティブチャートで表示する。必須要素:

- 種目別達成率バー
- PFC 実績ドーナツ(目標との重ね合わせ)
- **増減率(プログレッション)グラフ**: 直近30日の種目別推移
  - strength: 最大挙上重量・推定1RM(Epley)・総ボリューム(重量×レップ×セット)の折れ線 + 期間増減率(%)バッジ
  - cardio: 距離・継続時間・平均ペースの折れ線 + 期間増減率(%)バッジ
  - 記録2件未満の種目は「データ不足(あとN回の記録で表示可)」表示。補間・推測描画禁止
- Claude Code: HTML ファイルとして `results/YYYY-MM/daily/YYYY-MM-DD.html` に保存
- Claude.ai: アーティファクト表示 + 同内容の HTML を MCP 経由でコミット

### 5. クローズ処理

- 当日 Issue をクローズする(Code: `gh issue close` / Claude.ai: MCP)
- **Projects の Status を `Done` に更新する**:
  - Claude Code: `scripts/project_move.sh move-to-done --issue <番号>` を実行(内部で item-id / option-id を解決。`gh project item-edit` を Skill から直接呼ばない)
  - Claude.ai: MCP に Projects v2 操作が無い場合はスキップし、警告のみ出す(月次集計はラベルで完結)
- コミット: `report: YYYY-MM-DD daily report`

### 6. 完了報告

レポートのパス、達成率サマリー、クローズした Issue 番号を報告する。
