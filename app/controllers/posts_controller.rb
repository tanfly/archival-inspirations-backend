class PostsController < ApplicationController

    def index 
        user = User.find(params[:user_id])
        posts = user.posts
        favorites = user.favorites
        render json: PostSerializer.new(worlds)
    end

    def show
        post = Post.find(params[:id])
        options = {
            include: [:favorites]
        }
        render json: PostSerializer.new(post, options)
    end

    def create
        post = Post.new(post_params)
        if post.save
          render json: PostSerializer.new(post)
        end
    end

    def update
        post = Post.find(params[:id])
        post.update(post_params)
        if post.save
            render json: PostSerializer.new(post), status: :accepted
          else
            render json: { errors: post.errors.full_messages }, status: :unprocessible_entity
          end
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        head 204
      end


    private

    def world_params
        params.require(:post).permit(:photo, :title, :description, :favorites, :time_period, :user_id)
    end

end
