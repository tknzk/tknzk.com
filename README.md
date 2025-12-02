tknzk.com
=========

[![CircleCI](https://circleci.com/gh/tknzk/tknzk.com.svg?style=svg)](https://circleci.com/gh/tknzk/tknzk.com)

Takumi Kanzaki の個人ウェブサイトです。

## 技術スタック

- Ruby 3.2
- Sinatra
- Haml
- Puma
- Google App Engine

## セットアップ

```bash
bundle install
```

## ローカル起動

### 開発モード（ホットリロード）

```bash
bundle exec rerun -- rackup config.ru
```

ファイル変更時に自動でリスタートします。

### 通常起動

```bash
bundle exec rackup config.ru
```

デフォルトで http://localhost:9292 で起動します。

### Pumaで直接起動

```bash
bundle exec puma config.ru
```

## コード品質

```bash
bundle exec rubocop
```

## デプロイ

Google App Engine にデプロイします。

```bash
gcloud app deploy
```
