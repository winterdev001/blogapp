class AdminsController < ApplicationController
    
    def  index
        @search = Blog.ransack(params[:q])
        @blogs = @search.result
    end

    def new 
        @search = Blog.ransack(params[:q])
        @blogs = @search.result
    end
end
