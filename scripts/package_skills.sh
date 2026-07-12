#!/usr/bin/env bash
# package_skills.sh — .claude/skills/* を Claude.ai アップロード用 zip に変換する
#
# 使い方:
#   bash scripts/package_skills.sh
#
# 出力:
#   dist/<skill名>.zip(スキルごとに1ファイル。zip 直下に <skill名>/SKILL.md が入る構造)
#
# 変更時の同期手順は README.md「同期チェックリスト」を参照。
# 正はリポジトリ、Claude.ai 側は配布物。

set -euo pipefail

REPO_ROOT=$(cd "$(dirname "$0")/.." && pwd)
SKILLS_DIR="$REPO_ROOT/.claude/skills"
DIST_DIR="$REPO_ROOT/dist"

command -v zip >/dev/null || { echo "zip command not found" >&2; exit 1; }
[[ -d "$SKILLS_DIR" ]] || { echo "skills dir not found: $SKILLS_DIR" >&2; exit 1; }

mkdir -p "$DIST_DIR"

count=0
for skill_dir in "$SKILLS_DIR"/*/; do
  skill_name=$(basename "$skill_dir")
  [[ -f "$skill_dir/SKILL.md" ]] || { echo "SKIP (no SKILL.md): $skill_name" >&2; continue; }

  out="$DIST_DIR/${skill_name}.zip"
  rm -f "$out"
  (cd "$SKILLS_DIR" && zip -r -q "$out" "$skill_name" -x "*/.probe" -x "*/.DS_Store")
  echo "packaged: dist/${skill_name}.zip"
  count=$((count+1))
done

echo "----"
echo "$count skill(s) packaged into $DIST_DIR"
echo "次の手順: Claude.ai の Settings > Features から各 zip をアップロード(旧版は削除)"
