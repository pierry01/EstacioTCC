class Site::EventsController < SiteController
  def index
    @events = Event.order(start: :desc)
  end
  
  def show
    @event = Event.find(params[:id])
  end
end
