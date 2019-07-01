class Site::ScheduleController < SiteController
  def index
    @events = Event.all
  end
end
