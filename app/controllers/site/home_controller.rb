class Site::HomeController < SiteController
  def index
    @events = Event.all
    @carousel = Event.random(5)
  end
end
