class Backoffice::EventsController < BackofficeController
  before_action :set_event, only: [:edit, :update, :destroy]
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params_event)
    if @event.save
      redirect_to backoffice_admins_path, notice: "Administrador #{@event.email} criada!"
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @event.update(params_admin)
      AdminMailer.update_email(current_admin, @event).deliver_now
      redirect_to backoffice_admins_path, notice: "Administrador #{@event.email} alterada!"
    else
      render :edit
    end
  end
  
  def destroy
    if @event.destroy
      redirect_to backoffice_path, notice: "Evento excluído"
    else
      render :index
    end
  end
  
  private
  
  def set_event
    @event = Event.find(params[:id])
  end
end
