class Site::Cafe::HomeController < SiteController
  def index
    @menus = Menu.all
  end
end
