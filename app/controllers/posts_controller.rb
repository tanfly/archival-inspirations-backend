class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
  
    def index
      if logged_in?
          binding.pry
            if params[:user_id]
                posts = current_user.posts
                render json: PostSerializer.new(posts)
            else 
                posts = Post.all
                render json: PostSerializer.new(posts)
            end
        else
            render json: {
            error: "You must be logged in to see posts"
            }
        end
    end
  
    
    def show
      render json: PostSerializer.new(@post)
    end
  
    
    def create
      
      post = Post.new(post_params)
  
      if post.save
        render json: PostSerializer.new(post), status: :created
      else  
        error_resp = {
          error: post.errors.full_messages.to_sentence
        }
        render json: error_resp, status: :unprocessable_entity
      end
    end
  
    def update
      if @post.update(post_params)
        render json:PostSerializer.new(@post)
      else
         error_resp = {
          error: @post.errors.full_messages.to_sentence
        }
        render json: error_resp, status: :unprocessable_entity
      end
    end
  
    def destroy
      @post.destroy
      if @post.destroy
        render json: {
          message: "Post deleted!"
        }
  
      else
        error_resp = {
          error: "Something went wrong!"
        }
      end
    end
  
    private
      def set_post
        @post = Post.find(params[:id])
      end
  
      def post_params
        params.require(:post).permit(:photo, :title, :description, :time_period, :user_id)
      end
  end
