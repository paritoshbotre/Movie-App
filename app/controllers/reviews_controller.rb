class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie

  def new 
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = 'Review created sucessfully !!'
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require('review').permit(:rating, :comment)
  end

end
