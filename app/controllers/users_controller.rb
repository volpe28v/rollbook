class UsersController < ApplicationController
  def index
    @users = User.all
    @users = @users.sort{|a,b| (b.roll_books.entry.count <=> a.roll_books.entry.count)* 10 + (b.admin_events.count <=> a.admin_events.count) }
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    
    if params[:user][:password] != ""
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
    end

    if @user.save

    else
      render :action => :edit
    end
  end

end
