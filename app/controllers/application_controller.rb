class ApplicationController < ActionController::Base
    @search = Blog.ransack(params[:q])
    @blogs = @search.result
    # before_action :admin_authorize 
end
