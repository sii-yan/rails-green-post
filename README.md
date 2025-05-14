# 植物投稿アプリ - Green Post 🌿　

### 🌱 サービス概要

日々の栽培記録や、ふとした瞬間に見つけた植物や花を気軽に投稿できるサービスです。  
写真とともに育成の様子を残したり、他のユーザーの投稿を見て楽しめます。

---

### 🛠 使用技術

- フロントエンド: HTML / Sass / JavaScript (Importmap)
- バックエンド: Ruby on Rails 7
- DB: PostgreSQL (本番) 
- デプロイ: Render（Docker）
- 画像ストレージ: Amazon S3

---

### 📌 機能一覧

- ユーザー登録・ログイン / ログアウト
- 新規投稿（画像 + タイトル + 本文）
- 投稿詳細ページ（コメント・いいね機能付き）
- 投稿削除（マイページから）
- コメント投稿 / 削除
- いいね機能（Turbo使用で非同期）
- プロフィール編集（名前 / アイコン / 自己紹介）
- アカウント編集（メールアドレス / パスワード変更）

---

### ✨ 工夫ポイント

- Bootstrapベースのレイアウトに加え、Sass（BEM記法）でパーツを細かく管理
- Turbo を使った非同期処理（いいね）で操作性を向上
- partial を活用した共通コンポーネント設計（例：ユーザーアイコン表示）
- N+1問題の回避（includes / with_attached_image を活用）

---

### ⚙️ 環境構築手順（ローカル）

```bash
# リポジトリをクローン
git clone https://github.com/sii-yan/rails-green-post.git
cd rails-green-post

# 環境変数の設定（.envファイルを用意）
cp .env.example .env

# Dockerで起動
docker-compose up --build

# 初回のみマイグレーション・シード
docker-compose exec web rails db:create db:migrate db:seed
