class PlaylistsController < ApplicationController

  # our current homescreen
  def index
    @playlists = current_user.playlists
    # validate_playlists
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

  ### Do we need this ??? a lot of extra controller logic to account for duplicated playlist logic. maybe it should go somewere else?
  # def validate_playlists
  #   spotify_playlists = current_user.rspotify_user.playlists.map{ |p| p.name }
  #   missing_lists = []
  #   @playlists.each do |plist|
  #     unless spotify_playlists.include?(plist.name)
  #       missing_lists << plist.name
  #     end
  #   end
  #   if !missing_lists.empty?
  #     flash[:warning] = "Warning! Not all playlists were found on spotify: #{missing_lists}"
  #   end
  # end

end