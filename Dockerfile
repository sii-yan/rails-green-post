# Debianベースのイメージ
FROM ruby:3.2.2-bullseye

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  default-mysql-client \
  nodejs \
  npm \
  wget \
  gnupg \
  unzip \
  tzdata

# Google Chrome のインストール（Debian/Ubuntu系）
RUN apt-get update && apt-get install -y \
  wget \
  gnupg \
  unzip \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt install -y ./google-chrome-stable_current_amd64.deb \
  && rm google-chrome-stable_current_amd64.deb


# 作業ディレクトリの設定
WORKDIR /app

# Gemfile をコピーして bundle install
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install

# アプリケーションの全ファイルをコピー（Gemfile以外も）
COPY . .

