# The After Party

ライブの打ち上げに、こっそり同席する感覚。  
ミュージシャンの本音が聞こえる特等席へ、ようこそ。

---

## 🚀 クイックスタート

### 1. Hugoのインストール（まだの場合）

```bash
brew install hugo
```

### 2. セットアップ（コマンド一発）

```bash
chmod +x setup.sh && ./setup.sh
```

これだけで完了です！

### 3. ローカルサーバーの起動

```bash
hugo server
```

ブラウザで `http://localhost:1313` を開いてください。

---

## 📁 プロジェクト構成

```
the-after-party/
├── content/
│   └── posts/           # 記事ファイル（Markdown）
│       ├── tanaka-taro.md
│       └── suzuki-hanako.md
├── themes/
│   └── hermit-style/    # カスタムテーマ
│       └── layouts/
│           ├── _default/
│           │   ├── baseof.html
│           │   └── single.html
│           └── index.html
├── static/              # 画像などの静的ファイル
├── public/              # ビルド後のファイル（自動生成）
├── hugo.toml            # 設定ファイル
├── setup.sh             # セットアップスクリプト
└── README.md            # このファイル
```

---

## ✍️ 新しい記事の作成

### 手動で作成する場合

`content/posts/` に新しい `.md` ファイルを作成してください。

**テンプレート**:

```markdown
---
title: "記事のタイトル"
date: 2026-02-08T20:00:00+09:00
musician: "ミュージシャン名"
band: "バンド名（任意）"
draft: false
---

冒頭の文章。印象的な一言やシーンの描写から始めると良いです。

<!--more-->

## セクション1

本文...

## セクション2

本文...
```

### Hugoコマンドで作成する場合

```bash
hugo new content/posts/your-article-name.md
```

---

## 🎨 デザインについて

### テーマ: Hermit風

- **ダークモード**: 黒背景 + 白文字
- **セリフ体**: Times New Roman系フォント
- **モバイルファースト**: スマホでの可読性を最優先

### 一覧ページ

- カード型のレイアウト
- ホバー効果あり
- 「コレクションを並べる」感覚

### 記事ページ

- ゆったりとした行間
- セクション区切りは `<hr>` タグ
- 投げ銭ボタンあり

---

## 📱 モバイル対応

このサイトはモバイルファーストで設計されています。

想定シーン：
- バーやライブハウスでフライヤーのQRコードをスキャン
- スマホで記事を読みながら一杯

フォントサイズ、タップ領域、余白などすべてスマホでの快適性を重視しています。

---

## 🚢 デプロイ方法

### Netlifyへのデプロイ（推奨）

1. GitHubにプッシュ
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin YOUR_REPO_URL
   git push -u origin main
   ```

2. [Netlify](https://www.netlify.com/) にログイン

3. "Add new site" → "Import an existing project"

4. GitHubリポジトリを選択

5. ビルド設定:
   - Build command: `hugo`
   - Publish directory: `public`

6. Deploy!

### Vercelへのデプロイ

1. GitHubにプッシュ（上記と同じ）

2. [Vercel](https://vercel.com/) にログイン

3. "Add New" → "Project"

4. GitHubリポジトリを選択

5. Framework Preset: `Hugo`

6. Deploy!

---

## 💰 投げ銭の設定

現在は「準備中」となっています。実装するには：

### Stripe Payment Linksを使う場合

1. [Stripe](https://stripe.com/jp) でアカウント作成

2. Payment Links を作成
   - 金額: 500円、1000円、3000円など
   - 説明: 「〇〇さんへの投げ銭」

3. 生成されたURLを記事ページに埋め込み

`themes/hermit-style/layouts/_default/single.html` を編集：

```html
<a href="YOUR_STRIPE_PAYMENT_LINK_URL" class="donate-button">投げ銭する</a>
```

---

## 📝 質問リスト

取材用の質問リストは別ファイルで用意しています。

基本の13問：
1. どんな子供だった？
2. 音楽を始めたきっかけは？
3. 死ぬほど聴いたCDは？
4. 初めてステージに立った時のこと、覚えてる？
5. 「この人みたいになりたい」と思ったミュージシャンは？
6. 今のスタイルに共通項を感じるミュージシャンは？
7. このバンド/ユニットはどうやって始まったの？
8. ライブ前のルーティンってある？
9. 好きなお酒の銘柄とその理由
10. 音楽以外の趣味は？
11. 最近買って良かったもの
12. 「あの時は焦った」というエピソード
13. 忘れられない失敗ってありますか？

---

## 🎤 取材のTIPS

### 録音
- スマホのボイスメモでOK
- 静かな場所（カラオケの個室など）
- バッテリー確認を忘れずに

### 記事化
- 文字起こし（Whisper APIまたは手動）
- 2000-3000文字が目安
- 会話体を残す

### 写真
- ミュージシャンの許可を得る
- 記事に使う写真は `static/images/` に配置

---

## 📞 サポート

質問や問題があれば、GitHubのIssuesで報告してください。

---

## 📄 ライセンス

このプロジェクトはMITライセンスです。

---

**作成日**: 2026年1月28日  
**作成者**: さとレックス with Claude
