class UsersController < ApplicationController
    def index
         render json: User.all
        # render plain: "I'm in the index action!"
    end

    def create
        user = User.new(params.require(:user).permit(:email,:name))
        user.save!
        render json: user
    end

    def show
        render json:params
    end
end