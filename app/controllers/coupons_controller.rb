class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_gym!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_same_gym, only: [:edit, :update, :destroy]

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.all
    @gyms = Gym.all
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(coupon_params)
    @coupon.gym = current_gym

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/:id/join
  def join
    @coupon = set_coupon
    if !(@coupon.already_joined(@coupon,current_athlete))
      current_athlete.coupons.push(@coupon)
      respond_to do |format|
        format.html { redirect_to @coupon, notice: 'Coupon was successfully joined.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @coupon, notice: 'Coupon was already joined.' }
      end
    end
  end

  # PATCH/PUT /coupons/:id/leave
  def leave
    @coupon = set_coupon
    if (@coupon.already_joined(@coupon,current_athlete))
      current_athlete.coupons.delete(@coupon)
      respond_to do |format|
        format.html { redirect_to @coupon, notice: 'Coupon was successfully leaved.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @coupon, notice: 'Coupon was not already joined.' }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: 'Coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:name, :code, :description)
    end

    def require_same_gym
      if current_gym != @coupon.gym
        flash[:dander] = "You can only access your own coupons"
        redirect_to root_path
      end
    end
end
