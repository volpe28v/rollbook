# coding: utf-8
module ApplicationHelper

  # datetime:整形対象の日付時刻値(Timeオブジェクト)
  # type:出力形式(日付時刻 :datetime、日付のみ :date、時刻のみ :time)

  def format_datetime(datetime, type = :datetime)

    # 引数datetimeがnilの場合は空文字列を返す
    return '' unless datetime

    # 引数typeの値に応じて対応するフォーマット文字列をセット
    case type
      when :datetime
        format = '%Y年%m月%d日 %H:%M:%S'
      when :date
        format = '%Y年%m月%d日'
      when :datetime
        format = '%H:%M:%S'
    end

    # 指定されたフォーマットで日付時刻値を整形
    datetime.strftime(format)
  end
end
