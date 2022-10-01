⚠️こちらのサービスは現在作成中でございます⚠️

作業中の内容：デザインの改善、テストケースの追加・見直し

# ペイレコ(backend)
外貨に対応した給料計算・シフト管理サービス「ペイレコ」のバックエンドリポジトリです。
フロントエンドリポジトリは下記URLからご確認いただけます。

https://github.com/kazumi3858/payreco-frontend

## サービス概要
勤務スケジュールを登録することで給料が自動計算されるサービスです。
特徴は、外貨に対応しており日本円に換算した給料を表示してくれる点です。

## 使用技術
### バックエンド
* Rails 7.0.3.1

### フロントエンド
* Next.js 12.2.5
* TypeScript 4.7.4

認証機能はFirebase Authenticationを使用しました。
フロントエンドのAPI関連のコードはopenAPIコードジェネレーター(orval)を使って自動生成しました。

## インストール手順

### バックエンドのインストール手順
```
$ git clone https://github.com/kazumi3858/payreco-backend.git
$ bin/setup
$ rails s
```
使用している環境変数はこちらです。

|  環境変数名  |  説明  |
| ---- | ---- |
|  RATE_API_KEY  |  ExchangeRate APIから為替データを取得する際のキー  |
|  RAILS_API_CALL_TOKEN  |  Github Actionsからcronジョブを実行する際に設定したPOST用トークン  |

### フロントエンドのインストール手順
```
$ git clone https://github.com/kazumi3858/payreco-frontend.git
$ yarn install
$ yarn build
$ yarn start
```

使用している環境変数はこちらです。

|  環境変数名  |  説明  |
| ---- | ---- |
|  NEXT_PUBLIC_FIREBASE_API_KEY  |  Firebase Authenticationの設定に必要なデータ  |
|  NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN  |  Firebase Authenticationの設定に必要なデータ  |
|  NEXT_PUBLIC_FIREBASE_PROJECT_ID  |  Firebase Authenticationの設定に必要なデータ  |
|  NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET  |  Firebase Authenticationの設定に必要なデータ  |
|  NEXT_PUBLIC_FIREBASE_MESSAGE_SENDER_ID  |  Firebase Authenticationの設定に必要なデータ  |
|  NEXT_PUBLIC_FIREBASE_APP_ID  |  Firebase Authenticationの設定に必要なデータ  |
|  TEST_UID  |  CypressテストでFirebase Authenticationによるログインを実行するために必要なデータ  |
|  CYPRESS_FIREBASE_API_KEY  |  CypressテストでFirebase Authenticationによるログインを実行するために必要なデータ  |
|  CYPRESS_FIREBASE_AUTH_DOMAIN  |  CypressテストでFirebase Authenticationによるログインを実行するために必要なデータ  |
|  CYPRESS_FIREBASE_PROJECT_ID  |  CypressテストでFirebase Authenticationによるログインを実行するために必要なデータ  |
|  CYPRESS_FIREBASE_STORAGE_BUCKET  |  CypressテストでFirebase Authenticationによるログインを実行するために必要なデータ  |
|  CYPRESS_FIREBASE_MESSAGE_SENDER_ID  |  CypressテストでFirebase Authenticationによるログインを実行するために必要なデータ  |
|  CYPRESS_FIREBASE_APP_ID  |  CypressテストでFirebase Authenticationによるログインを実行するために必要なデータ  |
|  SERVICE_ACCOUNT  |  CypressテストでFirebase Authenticationによるログインを実行するために必要なデータ  |

## テストとリント
### バックエンド
リントの実行
```
$ bundle exec rubocop
```

テストの実行
```
$ bundle exec rspec
```

### フロントエンド
リントの実行
```
$ yarn format
```

テストの実行
```
$ yarn test
```

E2Eテストの実行
```
$ yarn build
$ yarn start
$ yarn cypress
```
