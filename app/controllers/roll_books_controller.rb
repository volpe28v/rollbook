class RollBooksController < ApplicationController
  before_filter :authenticate_user!

  # GET /events/1/roll_book/new
  def new
    @event = Event.find(params[:event_id])
    @roll_book = RollBook.new
  end

  # POST /events/1/roll_book/
  def create
    @roll_book = RollBook.new(params[:roll_book])

    if @roll_book.save
      redirect_to(event_path(params[:event_id]))
    else
      render :action => "new"
    end
  end

  def cancel
    @roll_book = RollBook.find(params[:id])
    @event = @roll_book.event
  end

  def do_cancel
    roll_book = RollBook.find(params[:id])
    roll_book.status = "cancel"
    roll_book.comment = params[:roll_book][:comment]
    roll_book.save

    redirect_to roll_book.event
  end

  def edit
    @roll_book = RollBook.find(params[:id])
    @event = @roll_book.event
  end

  def update
    roll_book = RollBook.find(params[:id])
    roll_book.status = "entry"
    roll_book.comment = params[:roll_book][:comment]
    roll_book.save

    redirect_to roll_book.event
  end

end
