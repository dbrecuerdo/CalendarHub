class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:show, :edit, :update, :destroy]
  before_action :check_authentication, only: [:edit, :update, :destroy]

  # GET /calendars
  # GET /calendars.json
  def index
    redirect_to events_path
    @calendars = current_user.calendars
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show
  end

  # GET /calendars/new
  def new
    @calendar = current_user.calendars.build
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = current_user.calendars.build(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to @calendar, notice: 'Calendar was successfully created.' }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    def validate_user
      unless current_user.calendars.include?(@calendar)
        format.html { redirect_to events_url, notice: 'You tried to access a page without proper authentication.' }
      end
    end

    def check_authentication
      unless @calendar.user == current_user
        format.html { redirect_to events_url, notice: 'You tried to access a page without proper authentication.' }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(:title, :description)
    end
end
