class UsersController < ApplicationController
    def index
        # render json: User.all
        render plain: "I'm in the index action!"
    end
end