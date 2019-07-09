class Site::CommentsController < SiteController
  before_action :authenticate_user!
  before_action :set_comment, only: :destroy

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to site_event_path(@comment.event_id), notice: 'Comentário adicionado!'
    else
      redirect_to site_event_path(@comment.event_id), alert: 'Erro ao adicionar comentário...'
    end
  end
  
  def destroy
    if @comment.destroy
      redirect_to request.referrer, notice: 'Comentário excluído!'
    else
      render :index
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :event_id)
  end
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
