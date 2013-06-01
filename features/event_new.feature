# coding: UTF-8
# language: ja

フィーチャ: イベントを作成する
  ユーザとして、
  RollBook のイベントを新規作成したい

  シナリオ: トップページから「新しいイベントを作成」をクリックし、新規イベント画面を表示する
    前提 ユーザ "小玉" が存在する
    もし  "トップページ" にアクセスする
    かつ "新しいイベントを作る" をクリックする
    かつ ユーザ "小玉" がログインする
    ならば "イベントを新規作成" と表示されること


  シナリオ: 新規イベント画面にイベント情報を登録し、イベント画面を表示する
    前提 ユーザ "小玉" が存在する
    もし  "トップページ" にアクセスする
    かつ "新しいイベントを作る" をクリックする
    かつ ユーザ "小玉" がログインする
    かつ イベントフォームにイベント名 "Ruby勉強会" と全ての情報を入力する
    かつ "登録" ボタンをクリックする
    ならば "Ruby勉強会" と表示されること
    かつ "このイベントに参加登録する" と表示されること
