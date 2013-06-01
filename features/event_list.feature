# coding: UTF-8
# language: ja

フィーチャ: イベント一覧にアクセスする
  ユーザとして、
  RollBookのイベント一覧を閲覧したい
  なぜなら、どのようなイベントが存在するか確認するため

  シナリオ: トップページにアクセスすると「これからの社内イベント一覧」が表示される
    もし  "トップページ" にアクセスする
    ならば "これからの社内イベント一覧" と表示されること
 

  シナリオ: 「過去のイベント一覧」をクリックすると「過去の社内イベント一覧」が表示される
    もし  "トップページ" にアクセスする
    かつ  "過去のイベント一覧" をクリックする
    ならば "過去の社内イベント一覧" と表示されること


  シナリオ: 非ログイン状態で「あなたの参加予定イベント一覧」をクリックすると「ログイン画面」が表示される
    もし  "トップページ" にアクセスする
    かつ  "あなたの参加予定イベント一覧" をクリックする
    ならば "ログイン" と表示されること

