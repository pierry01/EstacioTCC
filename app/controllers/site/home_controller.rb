class Site::HomeController < SiteController
  def index
    @events_carousel = []
    
    Event.all.each do |e|
      if e.start > DateTime.now
        @events_carousel << e
      end
    end
  end
end
