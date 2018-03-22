class PicturesController < ApplicationController
  
  before_action :set_pictures, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #追加
  
  def new
  end

  def create
    
  end

  def index
  end

end
