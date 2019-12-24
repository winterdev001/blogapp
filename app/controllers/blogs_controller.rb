class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new,:edit,:destroy]
  # GET /blogs
  # GET /blogs.json
  def search
    @blog =Blog.search(params[:search])
  end
  def index
    # @blogs = Blog.order("created_at DESC").all   
    @search = Blog.ransack(params[:q])
        @blogs = @search.result
    if params[:q]
        # @blogs = Blog.search(params[:search]).order("created_at DESC")
        @search = Blog.ransack(params[:q])
        @blogs = @search.result
       else
        @blogs = Blog.all.order('created_at DESC')
       end
    # @movies = @search.result
    #   @search = Blog.search(params[:q])    
    #   @blogs = if params[:search]
    #     Blog.where('title LIKE ? or content LIKE ?', "%#{params[:search]}%","%#{params[:search]}%").page(params[:page])    
    #     else
    #       #@blogs = Blog.all.order('created_at desc').page params[:page]
    #       @blogs = Blog.order("created_at DESC").page(params[:page])
    #     end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  def most_popular 
    # @blogs = Blog.all
    @search = Blog.ransack(params[:q])
    @blogs = @search.result
    @blog_id = params[:blog_id]
  end

  def blog_detail 
    # @blogs = Blog.all
    @search = Blog.ransack(params[:q])
    @blogs = @search.result
    @blog_id = params[:blog_id]
  end
  def all_blogs 
    # @blogs = Blog.all
    @search = Blog.ransack(params[:q])
    @blogs = @search.result
  end
  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
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
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content, :image, :admin_id, :search)
    end
end
