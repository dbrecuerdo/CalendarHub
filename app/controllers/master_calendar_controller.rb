class MasterCalendarController < ApplicationController
  def view
      start_day = DateTime.now
      if params[:start_date]
          start_day = DateTime.parse(params[:start_date])
      end
      @events = Event.where('start BETWEEN ? AND ?',start_day -31.days, start_day + 31.days).all
  end

  def view_day(events)
      @events = events
  end
end
