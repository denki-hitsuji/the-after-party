#!/usr/bin/env bash
set -euo pipefail

CONTENT_DIR="${1:-content}"
ERRORS=0
WARNINGS=0

echo "=== check-links: 末尾スラッシュ検証 ==="
echo ""

# Error: ](../slug) — no trailing slash, no extension → 404 in certain referrer paths
echo "【エラー】末尾スラッシュなしの相対ディレクトリリンク:"
while IFS= read -r line; do
  echo "  $line"
  ERRORS=$((ERRORS + 1))
done < <(grep -rEn '\]\(\.\./[^/.)]+\)' "$CONTENT_DIR" --include="*.md" 2>/dev/null || true)

if [ "$ERRORS" -eq 0 ]; then
  echo "  なし ✓"
fi

echo ""

# Warning: ](../slug/index.md) — works but inconsistent; prefer ../slug/
echo "【警告】index.md 明示リンク（末尾スラッシュに統一推奨）:"
while IFS= read -r line; do
  echo "  $line"
  WARNINGS=$((WARNINGS + 1))
done < <(grep -rEn '\]\(\.\./[^)]+/index\.md\)' "$CONTENT_DIR" --include="*.md" 2>/dev/null || true)

if [ "$WARNINGS" -eq 0 ]; then
  echo "  なし ✓"
fi

echo ""
echo "=== 結果: エラー ${ERRORS} 件 / 警告 ${WARNINGS} 件 ==="

[ "$ERRORS" -gt 0 ] && exit 1 || exit 0
