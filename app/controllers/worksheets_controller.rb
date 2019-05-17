class WorksheetsController < ApplicationController
  before_action :set_worksheet, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, except: [:index, :new, :create]
  before_action :authenticate_athlete!, only: [:new, :crea, :destroy]
  before_action :authenticate_gym!, only: [:edit, :update]

  # GET /worksheets
  # GET /worksheets.json
  def index
    #@worksheets = Worksheet.all
  end

  # GET /worksheets/1
  # GET /worksheets/1.json
  def show
  end

  # GET /worksheets/new
  def new
    @worksheet = Worksheet.new
  end

  # GET /worksheets/1/edit
  def edit
  end

  # POST /worksheets
  # POST /worksheets.json
  def create 
    @worksheet = Worksheet.new
    @worksheet.athlete = current_athlete
    @worksheet.gym = Gym.where(id: params[:worksheet][:gym_id].to_i).first

    respond_to do |format|
      if @worksheet.save
        format.html { redirect_to @worksheet, notice: 'Worksheet was successfully created.' }
        format.json { render :show, status: :created, location: @worksheet }
      else
        format.html { render :new }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worksheets/1
  # PATCH/PUT /worksheets/1.json
  def update
    @worksheet.comments = params[:worksheet][:comments]
    if params[:worksheet][:ex1] != "0" && !@worksheet.exercises.include?(params[:worksheet][:ex1])
      @worksheet.exercises.push(params[:worksheet][:ex1])
    end
    if params[:worksheet][:ex1] != "0" && !@worksheet.exercises.include?(params[:worksheet][:ex2])
      @worksheet.exercises.push(params[:worksheet][:ex2])
    end
    if params[:worksheet][:ex1] != "0" && !@worksheet.exercises.include?(params[:worksheet][:ex3])
      @worksheet.exercises.push(params[:worksheet][:ex3])
    end
    #@worksheet.gym = current_gym
    respond_to do |format|
      if @worksheet.update(worksheet_params)
        format.html { redirect_to @worksheet, notice: 'Worksheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @worksheet }
      else
        format.html { render :edit }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worksheets/1
  # DELETE /worksheets/1.json
  def destroy
    @worksheet.destroy
    respond_to do |format|
      format.html { redirect_to worksheets_url, notice: 'Worksheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worksheet
      @worksheet = Worksheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worksheet_params
      params.require(:worksheet).permit(:comments, :exercises)
    end

    def require_same_user
      :authenticate_gym! || :authenticate_athlete!
      @current_user = gym_signed_in? ? current_gym : current_athlete

      if @current_user != @worksheet.gym && @current_user != @worksheet.athlete
        flash[:dander] = "You can only access your own worksheets"
        redirect_to root_path
      end
    end

end
