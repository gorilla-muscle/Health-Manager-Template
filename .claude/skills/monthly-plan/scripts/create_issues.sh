#!/usr/bin/env bash
# create_issues.sh — 日次 Issue を gh CLI で一括発行する(Claude Code 用)
#
# 前提:
#   - 事前に日別 Issue 本文を <bodies_dir>/YYYY-MM-DD.md として書き出しておく
#   - 各本文ファイルの1行目はコメント行でタイトルを指定する:
#       <!-- title: [2026-07-12] Day12 - Pull(背中・二頭) -->
#       <!-- labels: training,nutrition,month:2026-07 -->
#     2行目以降が Issue 本文
#
# 使い方:
#   bash create_issues.sh --month 2026-07 --bodies-dir /tmp/issues [--project <番号>] [--owner <org/user>] [--dry-run]
#
# オプション:
#   --project  GitHub Projects(v2)の番号。指定時は gh project item-add で紐付ける
#   --owner    Projects のオーナー(既定: リポジトリオーナー)
#   --dry-run  発行せずにコマンドを表示のみ

set -euo pipefail

MONTH=""
BODIES_DIR=""
PROJECT=""
OWNER=""
DRY_RUN=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --month) MONTH="$2"; shift 2 ;;
    --bodies-dir) BODIES_DIR="$2"; shift 2 ;;
    --project) PROJECT="$2"; shift 2 ;;
    --owner) OWNER="$2"; shift 2 ;;
    --dry-run) DRY_RUN=true; shift ;;
    *) echo "unknown option: $1" >&2; exit 1 ;;
  esac
done

[[ -z "$MONTH" || -z "$BODIES_DIR" ]] && { echo "usage: $0 --month YYYY-MM --bodies-dir DIR [--project N] [--dry-run]" >&2; exit 1; }
[[ -d "$BODIES_DIR" ]] || { echo "bodies dir not found: $BODIES_DIR" >&2; exit 1; }

command -v gh >/dev/null || { echo "gh CLI not found" >&2; exit 1; }

if [[ -z "$OWNER" && -n "$PROJECT" ]]; then
  OWNER=$(gh repo view --json owner --jq .owner.login)
fi

# month ラベルが無ければ作成
gh label create "month:${MONTH}" --color 5319E7 --description "${MONTH} の日次記録" 2>/dev/null || true

created=0
failed=0

for body_file in "$BODIES_DIR"/"${MONTH}"-*.md; do
  [[ -e "$body_file" ]] || { echo "no body files matching ${MONTH}-*.md in $BODIES_DIR" >&2; exit 1; }

  title=$(sed -n '1s/<!-- title: \(.*\) -->/\1/p' "$body_file")
  labels=$(sed -n '2s/<!-- labels: \(.*\) -->/\1/p' "$body_file")
  [[ -z "$title" ]] && { echo "SKIP (no title header): $body_file" >&2; failed=$((failed+1)); continue; }
  [[ -z "$labels" ]] && labels="training,nutrition,month:${MONTH}"

  body=$(tail -n +3 "$body_file")

  if $DRY_RUN; then
    echo "[dry-run] gh issue create --title \"$title\" --label \"$labels\""
    created=$((created+1))
    continue
  fi

  if url=$(gh issue create --title "$title" --label "$labels" --body "$body"); then
    echo "created: $url"
    created=$((created+1))
    if [[ -n "$PROJECT" ]]; then
      gh project item-add "$PROJECT" --owner "$OWNER" --url "$url" \
        || echo "WARN: project item-add failed for $url (ラベル集計で運用継続可)" >&2
    fi
    sleep 1 # API レート制限対策
  else
    echo "FAILED: $title" >&2
    failed=$((failed+1))
  fi
done

echo "----"
echo "created: $created / failed: $failed"
[[ $failed -eq 0 ]] || exit 1
