class PicturesController < ApplicationController
  
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
#  before_action :authenticate_user! #追加

  before_action :login_check, only: [:new, :edit, :show ]
  
  def index
    @pictures = Picture.all
  end
  
  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    @picture.image.retrieve_from_cache!(params[:cache][:image])
    @picture.save!
    
    if @picture.save
      redirect_to pictures_path, notice: "画像を投稿しました！"
   #   ContactMailer.contact_mail(@picture).deliver
    else
      render 'new'
    end
  end
  
  def show
   @picture = Picture.find(params[:id])
   @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  

  end
  
  def edit
    @picture = Picture.find(params[:id])
  end
  
  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "画像、コメントを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"投稿を削除しました！"
    
  end
  
  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end


  
  private
  
  
  
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end
  
  # idをキーとして値を取得するメソッド
  
  def set_picture
    @picture = Picture.find(params[:id])
  end
  
  def login_check
    if current_user == nil
      redirect_to "/sessions/new"
    end
  end
end