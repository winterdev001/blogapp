class SessionsController < ApplicationController
    def new
        @search = Blog.ransack(params[:q])
        @blogs = @search.result
    end
end
