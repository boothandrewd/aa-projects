class AlbumsController < ApplicationController
  before_action :require_user!

  def new
    @album = Album.new
    render :new
  end

  def create
    album = Album.new(album_params)
    if album.save
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      redirect_to new_band_album(params[:band_id])
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    album = Album.find_by(id: params[:id])
    if album.update(album_params)
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      redirect_to edit_album_url(album)
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    if album.destroy
      redirect_to band_url(album.band_id)
    else
      redirect_to album_url(album)
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :recording_type, :band_id)
  end
end
