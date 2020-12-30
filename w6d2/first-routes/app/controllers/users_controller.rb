class UsersController < ApplicationController
    def index
         render json: User.all
        # render plain: "I'm in the index action!"
    end

    def create
        user = User.new(params.require(:user).permit(:email,:name))
        if user.save 
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
        # user.save!
        # render json: user
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        
    end
end