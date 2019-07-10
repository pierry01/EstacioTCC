class Backoffice::DashboardController < BackofficeController
  before_action :authenticate_admin!
  
  def index
    @menus = Menu.all
  end
end
