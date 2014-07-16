class BlogsController < ApplicationController
 #layout 'standard'
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :blog_permissions, only: [:update, :destroy, :edit]

  # GET /blogs
  # GET /blogs.json
  def index
    if user_signed_in? 
      @blogs = Blog.all 
    else redirect_to root_path
     end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if !user_signed_in?
    redirect_to root_path
  end

  end

  # GET /blogs/new
  def new
    if !user_signed_in?
    redirect_to root_path
  else
    @blog = Blog.new
  end
  end

  # GET /blogs/1/edit
  def edit
  end

  def all
  end
  # POST /blogs
  # POST /blogs.json
  def create
    
    @blog = Blog.new(blog_params) 
    @blog.user_id = current_user.id
    @blog.id=Blog.all.count+1
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blog }
      else
        format.html { render action: 'new' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :description)
    end

    def blog_permissions
      if @blog.user_id != current_user.id
        flash[:notice]="You don't have permission"
        redirect_to blogs_url 
      end
    end
end
