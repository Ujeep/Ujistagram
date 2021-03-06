class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:edit, :update, :destroy]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photos_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path,notice:"写真がアップロードされました"
      NoticeMailer.sendmail_photo(@photo).deliver
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if  @photo.update(photos_params)
      redirect_to photos_path,notice:"写真が編集されました"
    else
      render"edit"
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path,notice:"写真が削除されました！"
  end

  private
  def photos_params
    params.require(:photo).permit(:content,:image)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

end
