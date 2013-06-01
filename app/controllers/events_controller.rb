class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :done, :search]

  EventsPerPage = 50
  def index
    @events = Event.future.paginate(:page => params[:page],:per_page => EventsPerPage )
    @events_count = Event.future.count
    @latest_comments = Comment.latest

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  def search
    @word = params[:keyword]
    if @word.empty?
      redirect_to events_path 
      return
    end

    found_events = Event.future.keyword(@word)
    @events = found_events.paginate(:page => params[:page],:per_page => EventsPerPage )
    @events_count = found_events.count
    @latest_comments = Comment.latest

    respond_to do |format|
      format.html { render :action => "index" }# index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  def done
    @events = Event.past.paginate(:page => params[:page],:per_page => EventsPerPage )
    @events_count = Event.past.count
    @latest_comments = Comment.latest

    respond_to do |format|
      format.html { render :action => "index" }# index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  def entry
    @events = current_user.events.future.entry.paginate(:page => params[:page],:per_page => EventsPerPage )
    @events_count = current_user.events.future.entry.count
    @latest_comments = Comment.latest

    respond_to do |format|
      format.html { render :action => "index" }# index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    # イベントIDがアクション名で受け取った場合はINDEXへリダイレクトする
    unless params[:id] =~ /^\d+$/
      redirect_to events_path 
      return
    end

    @event = Event.find(params[:id])
    @comment = Comment.new

    @current_user_status = "nologin"
    if current_user != nil
      if @event.roll_books.has_user?(current_user)
        @current_roll_book = RollBook.where("user_id = ? and event_id = ?", current_user.id, @event.id).first
        @current_user_status = @current_roll_book.status
        @current_user_status = "entry" if @current_user_status == ""
      else
        @current_user_status = "noentry"
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    admin_event = AdminEvent.new

    admin_event.user = current_user
    @event.admin_event = admin_event

    @event.save

    respond_to do |format|
      if @event.save
        admin_event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.roll_books.each {|rb| rb.destroy }
    @event.comments.each {|cm| cm.destroy }
    @event.admin_event.destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end

  private

end
