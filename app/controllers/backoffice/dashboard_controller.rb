class Backoffice::DashboardController < BackofficeController
  before_action :authenticate_admin!
  
  def index
    @items = Item.all
    @menus = Menu.all
  end
end
