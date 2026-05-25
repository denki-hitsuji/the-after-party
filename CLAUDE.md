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

### 校正済み記事を公開するときは必ずdraftをmainに取り込む

記事の `draft: false` をmainにpushする前に、必ず `draft` ブランチをmainにマージすること。

```bash
# ✅ 正しい手順
git checkout main
git merge draft --no-ff
# draft: false に変更してコミット
git push denkihitsuji main
```

**理由：** draftブランチに校正済みの内容が残っている状態でmainだけに公開すると、未校正版が先にデプロイされる。

## デプロイ

GitHub Actions（`.github/workflows/gh-pages.yml`）がmainブランチへのpushで自動的に `hugo --minify` してgh-pagesブランチへデプロイする。
