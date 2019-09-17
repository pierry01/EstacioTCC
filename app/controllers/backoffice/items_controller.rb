class Backoffice::ItemsController < BackofficeController
  before_action :authenticate_admin!
  before_action :set_item, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.order(:id).page params[:page]
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  
    if @item.save
      redirect_to backoffice_items_path, notice: 'Item criado!'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to backoffice_items_path, notice: 'Item atualizado!'
    else
      render :edit
    end
  end
  
  def destroy
    if @item.destroy
      redirect_to backoffice_items_path, notice: 'Item excluído!'
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:id, :title, :quantity)
  end
end
