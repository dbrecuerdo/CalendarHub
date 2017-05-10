class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:show, :edit, :update, :destroy]
  before_action :check_authentication, only: [:edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.none
    @calendars=[]
    @calendars = current_user.calendars
    current_user.calendars.each do |calendar|
      @events = @events.or calendar.events
    end
    @categories = EventType.all
    if @categories.nil?
      @categories = []
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    if current_user.calendars.count<1
      format.html { redirect_to new_calendar_path, notice: 'You need at least 1 calendar to create and event.' }
    end
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def validate_user
      unless current_user.calendars.include?(@event.calendar)
        format.html { redirect_to events_url, notice: 'You tried to access a page without proper authentication.' }
      end
    end

    def check_authentication
      unless @event.user == current_user
        format.html { redirect_to events_url, notice: 'You tried to access a page without proper authentication.' }
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :event_type_id, :venue, :start, :end, :description, :calendar_id)
    end
end
