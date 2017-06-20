class ArtworkSharesController < ApplicationController
  def index
    render json: SharedArtwork.all
  end

  def create
    @artwork_share = SharedArtwork.new(artwork_shares_params)
    if @artwork_share.save
      render json: @artwork_share
    else
      render @artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork_share = SharedArtwork.find_by(id: params[:id])
    if @artwork_share.destroy
      render json: @artwork_share
    else
      render @artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def artwork_shares_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
