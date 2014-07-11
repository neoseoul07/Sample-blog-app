class CommentsController < ApplicationController
	def create
	@blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    @comment.user_id=current_user.id
    redirect_to blog_path(@blog)
end
def comment_params
	params.require(:comment).permit(:body)
    end

def destroy
	blog=nil
	Comment.find(params[:id]).tap{|comment| blog = comment.blog}.destroy
	flash[:notice]="comment deleted successfully"
	redirect_to blog_path(blog)
end
end