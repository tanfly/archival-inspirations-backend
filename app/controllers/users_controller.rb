class UsersController < ApplicationController
  wrap_parameters :user, include: [:username, :email, :password, :avatar]
  before_action :set_user, only: [:show, :update, :destroy]

    def index 
        users = User.all 
        options = {
            include: [:posts, :favorites]
        }
        render json: UserSerializer.new(users, options)
    end

    def show
        options = {
            include: [:posts, :favorites]
        }
        render json: UserSerializer.new(@user, options)
    end

    def create
        user = User.new(user_params)
        byebug
        if user.save
          render json: UserSerializer.new(user)
        end
    end

    def update
        @user.update(user_params)
        if @user.save
            render json: UserSerializer.new(@user), status: :accepted
          else
            render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
          end
    end

    def destroy
        @user.destroy
        head 204
      end

    private

    def set_post
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :avatar)
    end
        

    
end