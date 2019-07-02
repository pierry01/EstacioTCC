class Site::AppearController < SiteController
  before_action :set_event, only: :update
  before_action :authenticate_user!

  def update
    begin
      unless current_user.events.find(@event.id)
        @event.users << current_user
      end
    rescue ActiveRecord::RecordNotFound
      @event.users << current_user
      redirect_to site_event_path(@event), notice: 'Pré cadastrado!'
    end
  end
  
  private
  
  def params_event
    params.require(:event).permit(:id)
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
end
