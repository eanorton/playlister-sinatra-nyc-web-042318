class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    @artists = Artist.all
    @genres = Genre.all
    erb :"songs/new"
  end

  post "/songs" do
    @song = Song.find_or_create_by(params[:name])
    @artist = Artist.find_or_create_by(params[:artist]["name"])
    redirect "/songs/#{@song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params["slug"])
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params["slug"])
    @artist = Artist.all
    @genre = Genre.all
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params["slug"])
    @song.update(name: params["name"])
    redirect "/songs/#{@song.slug}"
  end

  delete "/songs/:slug" do
    @song = Song.find_by_slug(params["slug"])
    @song.delete
    redirect "/songs"
  end

end
