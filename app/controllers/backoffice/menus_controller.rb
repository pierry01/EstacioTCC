class Backoffice::MenusController < BackofficeController
  before_action :set_menu, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_admin!
  
  def index
    @menus = Menu.order(:id).page(params[:page])
  end
  
  def show
  end

  def new
    @menu = Menu.new
    @menu.items.build
    @items = Item.all
  end
  
  def create
    @items = Item.all
    @menu = Menu.new(params_menu)
    if @menu.save
      redirect_to backoffice_menus_path, notice: 'Cardápio criado!'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @menu.update(params_menu)
      redirect_to backoffice_menus_path, notice: 'Cardápio atualizado!'
    else
      render :edit
    end
  end
  
  def destroy
    if @menu.destroy
      redirect_to backoffice_menus_path, notice: 'Cardápio excluído!'
    else
      render :index
    end
  end
  
  private
  
  def params_menu
    params.require(:menu).permit(:id, :title, :description, :price, :image,
      items_attributes: [
        :title, :quantity
      ]
    )
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
