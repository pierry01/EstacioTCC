class Site::HomeController < SiteController
  def index
    @events = Event.all
  end
end
