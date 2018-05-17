class GenresController < ApplicationController

  get "/genres" do
    @genres = Genre.all
    erb :"genres/index"
  end

  get "/genres/new" do
    erb :"genres/new"
  end

  post "/genres" do
    @genres = Genre.create(params[:song])
    redirect "/genres/#{@genres.slug}"
  end

  get "/genres/:slug" do
    @genre = Genre.find_by_slug(params["slug"])
    erb :"genres/show"
  end

  get "/genres/:slug/edit" do
    @genre = Genre.find_by_slug(params["slug"])
    erb :"genres/edit"
  end

  patch "/genres/:slug" do
    @genre = Genre.find_by_slug(params["slug"])
    @genre.update(name: params["name"])
    redirect "/genres/#{@genre.slug}"
  end

  delete "/genres/:slug" do
    @genre = Genre.find_by_slug(params["slug"])
    @genre.delete
    redirect "/genres"
  end
end
