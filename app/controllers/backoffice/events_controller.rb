class Backoffice::EventsController < BackofficeController
  before_action :set_event, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_admin!
  
  def index
    @events = Event.order(:id).page(params[:page])
  end
  
  def show
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params_event)
    if @event.save
      redirect_to backoffice_events_path, notice: 'Evento criado!'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @event.update(params_event)
      redirect_to backoffice_events_path, notice: 'Evento atualizado!'
    else
      render :edit
    end
  end
  
  def destroy
    if @event.destroy
      redirect_to backoffice_events_path, notice: 'Evento excluído!'
    else
      render :index
    end
  end
  
  private
  
  def params_event
    params.require(:event).permit(:id, :title, :description, :start, :finish, :image)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
