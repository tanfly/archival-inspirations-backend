class FavoritesController < ApplicationController
    before_action :set_post
    before_action :authenticate

  
    def create
        byebug
        current_user.favorite(@post)
    
        render json: PostSerializer.new(@post)
    end
  
    
    def destroy
        current_user.unfavorite(@post)
    
        render json: PostSerializer.new(@post)
    end
  
    private

      def set_post
        @post = Post.find(params[:post_id])
      end
  
      def authenticate
        logged_in?
      end

end
