class Backoffice::StockController < BackofficeController
  before_action :authenticate_admin!

  def index
  end
end
