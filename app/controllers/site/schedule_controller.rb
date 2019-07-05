class Site::ScheduleController < SiteController
  def index
    @events = Event.order(:start)
  end
end
