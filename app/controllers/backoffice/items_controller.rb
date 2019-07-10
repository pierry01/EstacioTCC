class Backoffice::ItemsController < BackofficeController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to backoffice_stock_index_path, notice: 'Item criado!'
    else
      render :new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:id, :title, :quantity)
  end
end
