class AboutsController < ApplicationController
  def about
  end

  def index
    @search = Blog.ransack(params[:q])
    @blogs = @search.result.page params[:page]
  end
end
