class FavoritesController < ApplicationController
    before_action :set_post
    before_action :authenticate

  
    def create
      if session.loaded?
        current_user.favorite(@post)
    
        render json: PostSerializer.new(@post)
      end
    end
  
    
    def destroy
      if session.loaded?
        current_user.unfavorite(@post)
    
        render json: PostSerializer.new(@post)
      end
    end
  
    private

      def set_post
        @post = Post.find(params[:post_id])
      end
  
      def authenticate
        logged_in?
      end

end
