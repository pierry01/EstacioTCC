class Site::Cafe::HomeController < SiteController
  def index
    @menus = Menu.all.page params[:page]
  end
end
