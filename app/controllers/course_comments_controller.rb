class CourseCommentsController < ApplicationController
  before_action :set_course_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_athlete!, only: [:new, :create]
  before_action :require_same_athlete, only: [:edit, :update, :destroy]

  # GET /course_comments
  # GET /course_comments.json
  def index
    #@course_comments = CourseComment.all
  end

  # GET /course_comments/1
  # GET /course_comments/1.json
  def show
  end

  # GET /course_comments/new
  def new
    @course_comment = CourseComment.new
  end

  # GET /course_comments/1/edit
  def edit
  end

  # POST /course_comments
  # POST /course_comments.json
  def create
    @course_comment = CourseComment.new
    @course_comment.text = params[:course_comment][:text]
    @course_comment.athlete = current_athlete
    @course_comment.course = Course.where(id: params[:course_comment][:course_id].to_i).first

    respond_to do |format|
      if @course_comment.save
        format.html { redirect_to @course_comment, notice: 'Course comment was successfully created.' }
        format.json { render :show, status: :created, location: @course_comment }
      else
        format.html { render :new }
        format.json { render json: @course_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_comments/1
  # PATCH/PUT /course_comments/1.json
  def update
    respond_to do |format|
      if @course_comment.update(course_comment_params)
        format.html { redirect_to @course_comment, notice: 'Course comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_comment }
      else
        format.html { render :edit }
        format.json { render json: @course_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_comments/1
  # DELETE /course_comments/1.json
  def destroy
    @course_comment.destroy
    respond_to do |format|
      format.html { redirect_to course_comments_url, notice: 'Course comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_comment
      @course_comment = CourseComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_comment_params
      params.require(:course_comment).permit(:text, :gym_id)
    end

    def require_same_athlete
      if current_athlete != @course_comment.athlete
        flash[:dander] = "You can only edit your own comments"
        redirect_to root_path
      end
    end
end
