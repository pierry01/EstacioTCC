class Site::Cafe::CommentsController < SiteController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to site_cafe_menu_path(@comment.menu_id), notice: 'Comentário adicionado!'
    else
      redirect_to site_cafe_menu_path(@comment.menu_id), alert: 'Erro ao adicionar comentário...'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :menu_id)
  end
end
