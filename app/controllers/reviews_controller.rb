class ReviewsController < ApplicationController
  before_action :set_foodtruck, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.foodtruck = @foodtruck
    @review.user = current_user

    if @review.save
      redirect_to @foodtruck, notice: "Ton avis a été enregistré"
    else
      flash[:alert] = "Une erreur s'est produite, ton avis n'a pas été enregistré."
      render :new
    end
  end

  private

  def set_foodtruck
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
