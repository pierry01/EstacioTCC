class Site::CommentsController < SiteController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to site_event_path(@comment.event_id), notice: 'Comentário adicionado!'
    else
      redirect_to site_event_path(@comment.event_id), notice: 'Erro ao adicionar comentário...'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :event_id)
  end
end
