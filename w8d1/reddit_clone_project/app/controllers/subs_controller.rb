class SubsController < ApplicationController
    before_action :require_logged_in
    
    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        if @sub.moderator == current_user.id
            render :edit
        else
            redirect_to sub_url(@sub)
        end
    end

    def update
        @sub = current_user.subs.find_by(id: params[:id])
            if @sub.update(sub_params)
                redirect_to sub_url(@sub)
            else
                flash.now[:errors] = @sub.errors.full_messages
                render :edit
            end


        # @sub = Sub.find_by(id: params[:id])
        # if @sub.moderator == current_user.id
        #     if @sub.update(sub_params)
        #         redirect_to sub_url(@sub)
        #     else
        #         flash.now[:errors] = @sub.errors.full_messages
        #         render :edit
        #     end
        # else
        #     render :show
        # end
    end
    
    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end


    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
