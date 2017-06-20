class ArtworksController < ApplicationController
  def index
    @results = params[:user_id] ? User.find(params[:user_id]).artworks : Artwork.all
    render json: @results
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork
      render json: @artwork
    else
      render @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork.update_attributes(artwork_params)
      render json: @artwork
    else
      render @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork.destroy
      render json: @artwork
    else
      render @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
