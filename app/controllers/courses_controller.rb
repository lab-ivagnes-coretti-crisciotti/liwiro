class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_gym!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_same_gym, only: [:edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    @gyms = Gym.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.gym = current_gym
    @course.likes = 0

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/:id/join
  def join
    @course = set_course
    if !(@course.already_joined(@course,current_athlete))
      current_athlete.courses.push(@course)
      respond_to do |format|
        format.html { redirect_to @course, notice: 'Course was successfully joined.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @course, notice: 'Course was already joined.' }
      end
    end
  end

  # PATCH/PUT /courses/:id/leave
  def leave
    @course = set_course
    if (@course.already_joined(@course,current_athlete))
      current_athlete.courses.delete(@course)
      respond_to do |format|
        format.html { redirect_to @course, notice: 'Course was successfully leaved.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @course, notice: 'Course was not already joined.' }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :likes, :comments)
    end

    def require_same_gym
      if current_gym != @course.gym
        flash[:dander] = "You can only access your own courses"
        redirect_to root_path
      end
    end
end
