class CommentsController < ApplicationController
	respond_to :html, :js
	def create
	@blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    @comment.user_id=current_user.id
    #@comment.id=Comment.all.count+1
    respond_to do |format|
    format.html { redirect_to blog_path(@blog)}
    format.js
  end
    
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

def edit
	end

end