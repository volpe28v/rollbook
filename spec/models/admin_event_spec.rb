require 'spec_helper'

describe AdminEvent do
  describe "イベントを作成した場合" do
    before do
      event = Event.new(:title => "hello",:content => "naiyo-", :start => "2011-10-30-18:00", :capacity => "1", :place => "here")
      admin_event = AdminEvent.new
      user = User.new(:name => "kodama", :email => "kodama@hogehoge.com", :password => "passpasspass", :password_confirmation => "passpasspass", :remember_me => true)

      event.admin_event = admin_event
      #user.admin_events << admin_event
      admin_event.user = user

      event.save
      user.save!
      admin_event.save

      @event_id = event.id
      @user_id = user.id
      @admin_event_id = admin_event.id
    end

    it "イベントからユーザを取得できること" do
      #@event_id.should_not ==  0
      Event.find(@event_id).admin_event.should == AdminEvent.find(@admin_event_id)
    end

    it "管理者からイベントを取得できること" do
      User.find(@user_id).admin_events.exists?(@admin_event).should be_true 
    end
  end
end
