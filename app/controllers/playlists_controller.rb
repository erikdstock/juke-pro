class PlaylistsController < ApplicationController

  def index
    @playlists = current_user.playlists
  end

  def new
    @playlist = Playlist.new
  end

  def create
    playlist = Playlist.new(playlist_params)
    playlist.update(user: current_user)
    redirect_to playlist
  end

  def show
    @playlist = Playlist.find_by(id: params[:id])
  end

  def edit
    @playlist = Playlist.find_by(id: params[:id])
  end

  def update
    playlist = Playlist.find_by(id: params[:id])
    playlist.update(playlist_params)
    redirect_to playlist
  end

  def destroy
    playlist = Playlist.find_by(id: params[:id])
    playlist.destroy
    redirect_to root_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

end