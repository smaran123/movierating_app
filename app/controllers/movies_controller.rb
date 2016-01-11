class MoviesController < ApplicationController
	before_action :set_movie, :except => [:index,:new,:create]
	before_action :authenticate_user!, :except => [:index,:show]
	def new
		@movie = current_user.movies.build
	end

	def create
		@movie = current_user.movies.build(movie_params)
		if @movie.save
			redirect_to movies_path
		else
			render 'new'
		end
	end

	def show
		
		@reviews = Review.where(:movie_id=>@movie.id).order("created_at DESC")
		
		if @reviews.blank?
			@avg_review = 0
		else
			@avg_review = @reviews.average(:rating).round(2)
		end
	end

	def index
		# @movies = Movie.search(params[:search])
			@movies = Movie.search params[:search]
	end 


	def edit
	end 

	def update
		if @movie.update_attributes(movie_params)
			redirect_to movies_path
		else
			render action: 'edit'
		end
	end

	def destroy
		@movie.destroy
		redirect_to movies_path
	end 


	private

	def set_movie
		@movie = Movie.find(params[:id])
	end

	def movie_params
		params.require(:movie).permit!
	end


end
