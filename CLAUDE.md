# After Party — Claude Code ガイド

## サイト概要

HugoベースのWebマガジン。Vercelにデプロイ。ドメイン: magazine.soundwalk.net

## コンテンツ構成

- `content/posts/{musician-slug}/{episode-number}/index.md` — 各話のleaf bundle
- `content/thanks/{musician-slug}/index.md` — 購入サンクスページ

## ルール

### 相対リンクには必ず末尾スラッシュを付ける

記事内で次の話へリンクする際、末尾スラッシュ（trailing slash）を**必ず**付ける。

```markdown
# ❌ 悪い例
*[第3話につづく](../03)*

# ✅ 良い例
*[第3話につづく](../03/)*
```

**理由：** Vercelは末尾スラッシュなしのURLへのリダイレクトを自動で行わない。前の話のリンクから遷移すると `/posts/yurie-and-mercy/02`（スラッシュなし）で到達する。このとき `../03` が `/posts/03` と解決されて404になる。vercel.jsonに `trailingSlash: true` を設定済みだが、コンテンツ側も末尾スラッシュ付きで書くこと。

## デプロイ

GitHub Actions（`.github/workflows/gh-pages.yml`）がmainブランチへのpushで自動的に `hugo --minify` してgh-pagesブランチへデプロイする。
