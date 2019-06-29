class Site::EventsController < SiteController
  def show
    @event = Event.find(params[:id])
  end
end
