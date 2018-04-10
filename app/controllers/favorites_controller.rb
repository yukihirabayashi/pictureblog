class FavoritesController < ApplicationController
  
  def index
   @favorites_pictures = current_user.favorite_pictures
  end
  
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice:"#{favorite.picture.user.email}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(picture_id: params[:picture_id]).destroy
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんのブログをお気に入り解除しました"
  end
  
  
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :icon)
    end
    
end
