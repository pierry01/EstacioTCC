class Site::Cafe::MenusController < SiteController
  def show
    @menu = Menu.find(params[:id])
  end
end
