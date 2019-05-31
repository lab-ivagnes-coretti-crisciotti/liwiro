class GymReviewsController < ApplicationController
  before_action :set_gym_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_athlete!, only: [:new, :create]
  before_action :require_same_athlete, only: [:edit, :update, :destroy]

  # GET /gym_reviews
  # GET /gym_reviews.json
  def index
    #@gym_reviews = GymReview.all
  end

  # GET /gym_reviews/1
  # GET /gym_reviews/1.json
  def show
  end

  # GET /gym_reviews/new
  def new
    @gym_review = GymReview.new
  end

  # GET /gym_reviews/1/edit
  def edit
  end

  # POST /gym_reviews
  # POST /gym_reviews.json
  def create
    @gym_review = GymReview.new(gym_review_params)
    @gym_review.athlete = current_athlete
    @gym_review.gym = Gym.where(id: params[:gym_review][:gym_id].to_i).first

    respond_to do |format|
      if @gym_review.save
        format.html { redirect_to @gym_review, notice: 'Gym review was successfully created.' }
        format.json { render :show, status: :created, location: @gym_review }
      else
        format.html { render :new }
        format.json { render json: @gym_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gym_reviews/1
  # PATCH/PUT /gym_reviews/1.json
  def update
    respond_to do |format|
      if @gym_review.update(gym_review_params)
        format.html { redirect_to @gym_review, notice: 'Gym review was successfully updated.' }
        format.json { render :show, status: :ok, location: @gym_review }
      else
        format.html { render :edit }
        format.json { render json: @gym_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gym_reviews/1
  # DELETE /gym_reviews/1.json
  def destroy
    @gym_review.destroy
    respond_to do |format|
      format.html { redirect_to gym_reviews_url, notice: 'Gym review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gym_review
      @gym_review = GymReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gym_review_params
      params.require(:gym_review).permit(:text, :stars)
    end

    def require_same_athlete
      if current_athlete != @gym_review.athlete
        flash[:dander] = "You can only edit your own reviews"
        redirect_to root_path
      end
    end
end
