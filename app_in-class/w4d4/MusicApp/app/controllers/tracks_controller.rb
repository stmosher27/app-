class TracksController < ApplicationController

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save!
      redirect_to album_url(@track.album_id)
    else
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to album_url(@track.album_id)
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_url(@track.album_id)
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :bonus, :lyrics, :name, :ord)
  end
end
