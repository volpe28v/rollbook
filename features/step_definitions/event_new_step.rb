# coding: UTF-8

前提 /^ユーザ "([^"]*)" が存在する$/ do |user_name|
  case user_name
  when "小玉"
    User.create(:name => user_name, :email => "kodama.naoki@hogehoge.com", :password => "kodama.hoge", :password_confirmation => "kodama.hoge")
  else
  end

end

もし /^ユーザ "([^"]*)" がログインする$/ do |user_name|
  case user_name
  when "小玉"
    fill_in("user_email", :with => "kodama.naoki@hogehoge.com")
    fill_in("user_password", :with => "kodama.hoge")
  else
  end

  click_button "ログイン"
end

もし /^イベントフォームにイベント名 "([^"]*)" と全ての情報を入力する$/ do |title|
  fill_in("event_title", :with => title)
  fill_in("event_content", :with => "内容")
  fill_in("event_start", :with => "2015-10-30-13:00")
  fill_in("event_capacity", :with => "10")
  fill_in("event_place", :with => "札幌拠点")
end

