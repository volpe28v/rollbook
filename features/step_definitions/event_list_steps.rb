# coding: UTF-8
# language: ja

もし /^"([^"]*)" にアクセスする$/ do |page_name|
  visit(path_to page_name)
end

ならば /^"([^"]*)" と表示されること$/ do |text|
  page.should have_content(text)
end

もし /^"([^"]*)" をクリックする$/ do |link_name|
  click_link link_name
end

もし /^"([^"]*)" ボタンをクリックする$/ do |button_name|
  click_button button_name
end

