class Site::HomeController < SiteController
  def index
    @carousel = Event.with_attached_image.random(5)
  end
end
