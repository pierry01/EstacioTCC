class Site::ScheduleController < SiteController
  def index
    @events = Event.with_attached_image.order(:start)
  end
end
