# UPDATING.md — テンプレート更新の取り込み手順

テンプレート方式は fork と違い、本体(health-manager-template)の更新は自動では取り込まれない。Skills の改善や DB の拡充を自分のリポジトリへ反映する手順を示す。

## 取り込み対象と方針

| パス | 方針 |
|---|---|
| `.claude/`(Skills・Agents) | **上書きで取り込んでよい**(個人データを含まない) |
| `scripts/` | 同上 |
| `CLAUDE.md` | 同上(独自カスタマイズしている場合は差分確認) |
| `.github/` | `config.yml` は setup.sh で自リポジトリ向けに書き換え済みのため**差分確認して手動反映** |
| `references/`(種目DB・食材DB・app-import-map) | **手動マージ必須**。あなたの「ユーザー登録種目/食材」「アプリマッピング」は各ファイル末尾の専用セクションにあるため、本体側の変更(初期DB部分)だけを取り込み、自分のセクションを保持する |
| `data/` `plans/` `results/` | **絶対に取り込まない**(あなたの実データ) |

## 手順

```bash
# 1. テンプレートを upstream として追加(初回のみ)
git remote add template https://github.com/OWNER/health-manager-template.git

# 2. 最新を取得
git fetch template

# 3. エンジン部分のみ取り込み
git checkout template/main -- .claude/ scripts/ CLAUDE.md

# 4. references/ は差分を確認して手動マージ
git diff HEAD template/main -- references/
#   → 初期DB部分の変更のみ採用し、自分の「ユーザー登録」セクションは保持する

# 5. 動作確認 → コミット
git add -A && git commit -m "chore: sync template updates"
```

## 取り込み後のチェックリスト

- [ ] Claude.ai でも運用している場合: `bash scripts/package_skills.sh` → zip 再アップロード → CLAUDE.md 変更時は Project instructions 更新
- [ ] `references/` の自分の「ユーザー登録種目/食材」「アプリマッピング」が消えていないこと
- [ ] `.github/ISSUE_TEMPLATE/config.yml` のリンクが自分のリポジトリを指していること
