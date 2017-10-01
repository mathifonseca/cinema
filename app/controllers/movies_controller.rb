require 'uri'
require 'net/http'

class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    resolve_format @movies
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
    resolve_format @movie
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def search
    url = URI("https://api.themoviedb.org/3/search/movie?include_adult=false&page=1&query=star&language=en-US&api_key=4883683d8402af2dfc264b8d1fc64316")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request.body = "{}"

    response = http.request(request)

    arr = JSON.parse(response.read_body)

    puts arr
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def resolve_format(obj)
    respond_to do |format|
      format.html
      format.xml { render :xml => obj }
      format.json { render :json => obj }
    end
  end

end