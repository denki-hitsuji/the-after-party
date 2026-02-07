# The After Party - クイックスタートガイド

このファイルを読めば、5分でサイトが立ち上がります。

---

## 📦 このzipファイルの使い方

### ステップ1: 解凍する

zipファイルを解凍して、中身を `/Users/satrex/projects/hugo/after-party` に配置してください。

```bash
# zipを解凍（ダウンロードフォルダから）
unzip the-after-party.zip

# 中身を移動
mv the-after-party/* /Users/satrex/projects/hugo/after-party/
```

または、Finderでドラッグ&ドロップでもOKです。

---

### ステップ2: セットアップスクリプトを実行（コマンド一発）

ターミナルで以下のコマンドを実行：

```bash
cd /Users/satrex/projects/hugo/after-party
chmod +x setup.sh && ./setup.sh
```

**これだけで完了です！**

---

### ステップ3: ローカルサーバーを起動

```bash
hugo server
```

ブラウザで `http://localhost:1313` を開いてください。

---

## 🎉 完成！

サンプル記事が2本入った状態で表示されます。

---

## 📱 スマホでの確認方法

### 同じWi-Fiに接続している場合

1. ターミナルでサーバーを起動
   ```bash
   hugo server --bind 0.0.0.0
   ```

2. MacのIPアドレスを確認
   ```bash
   ifconfig | grep "inet "
   ```
   
   例: `192.168.1.10`

3. スマホのブラウザで以下を開く
   ```
   http://192.168.1.10:1313
   ```

---

## 🚀 次にやること

1. **新しい記事を作成**
   - `content/posts/` に `.md` ファイルを追加

2. **投げ銭を設定**
   - Stripe Payment Linksを作成
   - `themes/hermit-style/layouts/_default/single.html` を編集

3. **デプロイ**
   - GitHubにプッシュ
   - Netlify または Vercelでデプロイ

詳しくは `README.md` をご覧ください。

---

## ❓ トラブルシューティング

### Hugoがインストールされていない

```bash
brew install hugo
```

### ポート1313が使用中

```bash
hugo server --port 1314
```

### ビルドエラーが出る

```bash
hugo --verbose
```

でエラーの詳細を確認してください。

---

**それでは、良いサイト構築を！** 🎵
