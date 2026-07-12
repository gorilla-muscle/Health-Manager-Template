#!/usr/bin/env bash
# setup.sh — テンプレートから作成した自分のリポジトリの初期化
#
# 実行内容:
#   1. リポジトリが Private であることの確認(Public なら警告して中断)
#   2. ラベル一括作成
#   3. 当月の data/ ファイル(metrics / exercise-log)の生成
#   4. Issue テンプレート内のリポジトリリンクを自分のリポジトリに書き換え
#
# 使い方: リポジトリ直下で  bash scripts/setup.sh

set -euo pipefail

command -v gh >/dev/null || { echo "ERROR: gh CLI が必要です (https://cli.github.com)" >&2; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "ERROR: gh auth login を先に実行してください" >&2; exit 1; }

REPO_ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$REPO_ROOT"

# 1. Private 確認(健康情報を含むため必須)
VISIBILITY=$(gh repo view --json visibility --jq .visibility 2>/dev/null || echo "UNKNOWN")
if [[ "$VISIBILITY" == "PUBLIC" ]]; then
  echo "ERROR: このリポジトリは Public です。体組成・健康情報を記録するため Private 必須です。" >&2
  echo "       Settings > General > Danger Zone から Private に変更後、再実行してください。" >&2
  exit 1
fi
echo "visibility: $VISIBILITY (OK)"

# 2. ラベル作成
echo "--- ラベル作成 ---"
gh label create training --color 1D76DB --description "トレーニング日" 2>/dev/null || echo "exists: training"
gh label create nutrition --color 0E8A16 --description "食事記録" 2>/dev/null || echo "exists: nutrition"
gh label create rest --color C5DEF5 --description "休養日" 2>/dev/null || echo "exists: rest"
gh label create reminder --color FBCA04 --description "月初リマインド" 2>/dev/null || echo "exists: reminder"
gh label create "status:pending-review" --color D93F0B --description "レビュー待ち" 2>/dev/null || echo "exists: status:pending-review"
# month:YYYY-MM ラベルは monthly-plan スキルが発行時に自動作成する

# 3. 当月データファイル生成
MONTH=$(date +%Y-%m)
echo "--- data/ 初期化 ($MONTH) ---"
if [[ ! -f "data/metrics/${MONTH}.md" ]]; then
  cat > "data/metrics/${MONTH}.md" <<EOF
# ${MONTH} メトリクス

1行 = 1日。単位固定: 体重 kg / 体脂肪率 %(任意・未計測は—) / 睡眠 h / 歩数 歩 / 水分 ml。
スキーマは \`.claude/skills/profile-manager/references/profile-schema.md\` §2 を参照。

| 日付 | 体重kg | 体脂肪率% | 睡眠h | 歩数 | 水分ml | 摂取kcal | P | F | C | 備考 |
|---|---|---|---|---|---|---|---|---|---|---|
EOF
  echo "created: data/metrics/${MONTH}.md"
fi
if [[ ! -f "data/exercise-log/${MONTH}.md" ]]; then
  cat > "data/exercise-log/${MONTH}.md" <<EOF
# ${MONTH} 種目別実績ログ

1行 = 1種目実績。スキーマは \`.claude/skills/profile-manager/references/profile-schema.md\` §3 を参照。
増減率グラフの**唯一の計算ソース**(Issue 本文の再パース禁止)。

| 日付 | 種目名 | 種別 | 重量kg | レップ | セット | 距離km | 時間min | 備考 |
|---|---|---|---|---|---|---|---|---|
EOF
  echo "created: data/exercise-log/${MONTH}.md"
fi

# 4. Issue テンプレートのリンク書き換え
NWO=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
if grep -q 'OWNER/' .github/ISSUE_TEMPLATE/config.yml 2>/dev/null; then
  sed -i.bak "s|https://github.com/OWNER/[^#]*#readme|https://github.com/${NWO}#readme|" .github/ISSUE_TEMPLATE/config.yml
  rm -f .github/ISSUE_TEMPLATE/config.yml.bak
  echo "updated: .github/ISSUE_TEMPLATE/config.yml -> ${NWO}"
fi

echo "----"
echo "セットアップ完了。次の手順:"
echo "  1. 変更をコミット・push: git add -A && git commit -m 'chore: initial setup' && git push"
echo "  2. (任意) GitHub Projects で月次ボード(Todo/Done/Skipped)を作成"
echo "  3. Claude Code をリポジトリ直下で起動し「今月のメニューを作って」と依頼"
