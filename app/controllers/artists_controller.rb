class ArtistsController < ApplicationController
  get "/artists" do
    @artists = Artist.all
    erb :"artists/index"
  end

  get "/artists/new" do
    erb :"artists/new"
  end

  post "/artists" do
    @artists = Artist.create(params[:song])
    redirect "/artists/#{@artists.slug}"
  end

  get "/artists/:slug" do
    @artist = Artist.find_by_slug(params["slug"])
    erb :"artists/show"
  end

  get "/artists/:slug/edit" do
    @artist = Artist.find_by_slug(params["slug"])
    erb :"artists/edit"
  end

  patch "/artists/:slug" do
    @artist = Artist.find_by_slug(params["slug"])
    @artist.update(name: params["name"])
    redirect "/artists/#{@artist.slug}"
  end

  delete "/artists/:slug" do
    @artist = Artist.find_by_slug(params["slug"])
    @artist.delete
    redirect "/artists"
  end


end
