class PicturesController < ApplicationController
  
 # before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #追加
  
  def index
    @pictures = Picture.all
  end
  
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      
      redirect_to pictures_path, notice: "画像を投稿しました！"
    else
      render 'new'
    end
  end
  
  def show
    @picture = Picture.find(params[:id])
  end

  
  private
  
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache,)
  end  

end