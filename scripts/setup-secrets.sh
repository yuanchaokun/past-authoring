#!/usr/bin/env bash
# ============================================================
# Past Authoring · 一键配置 GitHub Secrets
# 运行: bash scripts/setup-secrets.sh
# ============================================================
set -e

ACCOUNT_ID="ad79f21230344be2e7a62597f2c20586"
GITHUB_REPO="yuanchaokun/past-authoring"

echo ""
echo "🔧  Past Authoring · GitHub Secrets 配置"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "需要一个 Cloudflare API Token（已为你打开创建页面）"
echo ""
echo "创建步骤（30秒搞定）:"
echo "  1. 浏览器中点击  「Use template」→ 选 「Edit Cloudflare Workers」"
echo "  2. 在 Permissions 里确认有 「Cloudflare Pages - Edit」"
echo "  3. Account Resources 选「 Include - 你的账号」"
echo "  4. 点 「Continue to summary」→「Create Token」"
echo "  5. 复制生成的 Token（只显示一次！）"
echo ""

read -rp "请粘贴你的 API Token: " API_TOKEN

if [ -z "$API_TOKEN" ] || [ ${#API_TOKEN} -lt 20 ]; then
  echo "❌ Token 无效，请重新运行"
  exit 1
fi

echo ""
echo "⏳ 验证 Token..."
RESULT=$(curl -s "https://api.cloudflare.com/client/v4/user/tokens/verify" \
  -H "Authorization: Bearer $API_TOKEN")
STATUS=$(echo "$RESULT" | python3 -c "import json,sys; d=json.load(sys.stdin); print(d.get('result',{}).get('status','invalid'))")

if [ "$STATUS" != "active" ]; then
  echo "❌ Token 验证失败: $RESULT"
  exit 1
fi
echo "✅ Token 有效"

echo ""
echo "⏳ 写入 GitHub Secret: CLOUDFLARE_API_TOKEN..."
gh secret set CLOUDFLARE_API_TOKEN --repo "$GITHUB_REPO" --body "$API_TOKEN"
echo "✅ CLOUDFLARE_API_TOKEN 已写入"

echo ""
echo "⏳ 写入 GitHub Secret: CLOUDFLARE_ACCOUNT_ID..."
gh secret set CLOUDFLARE_ACCOUNT_ID --repo "$GITHUB_REPO" --body "$ACCOUNT_ID"
echo "✅ CLOUDFLARE_ACCOUNT_ID 已写入"

echo ""
echo "🚀 触发首次自动部署..."
gh workflow run deploy.yml --repo "$GITHUB_REPO"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ 全部配置完成！"
echo ""
echo "   GitHub Actions: https://github.com/$GITHUB_REPO/actions"
echo "   Cloudflare Pages: https://past-authoring-eub.pages.dev"
echo ""
