class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course created!"
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = "Course updated!"
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.sections.each do |section|
      section.lessons.each do |lesson|
        lesson.destroy
      end
      section.destroy
    end
    @course.destroy
    flash[:notice] = "Course '#{@course.name}' has been deleted."
    redirect_to courses_path
  end

private
  def course_params
    params.require(:course).permit(:name)
  end
end
