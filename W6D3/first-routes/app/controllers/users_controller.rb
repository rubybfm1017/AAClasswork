require "byebug"
class UsersController < ApplicationController
    def index
         render json: User.all
        # render plain: "I'm in the index action!"
    end

    def create
        user = User.new(user_params)
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
        # debugger
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
        # User.update(params[:id]=> params.require(:user).permit(:email,:name))
    end

    def destroy
        user = User.find(params[:id])
        # User.destroy(params[:id])
        user.destroy
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
end