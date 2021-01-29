class PostsController < ApplicationController
    before_action :require_logged_in

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to post_url(@post)
        else
            render :new
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    # from here
    def update
        @post = Post.find_by(id: params[:id])
        if @post.user_id == current_user.id
            if @post.update(post_params)
                redirect_to post_url(@post)
            else
                flash.now[:errors] = @post.errors.full_messages
                render :edit
            end
        else
            render :show
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id)
    end
end
