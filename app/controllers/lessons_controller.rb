class LessonsController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson created!"
      redirect_to section_lesson_path(@section, @lesson)
    else
      render :new
    end
  end

  def show
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.find(params[:id])
  end

  def edit
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.find(params[:id])
  end

  def update
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = "Lesson updated!"
      redirect_to section_lesson_path(@section, @lesson)
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.find(params[:id])
    @lesson.destroy
    flash[:notice] = "Lesson '#{@lesson.name}' has been deleted."
    redirect_to course_section_path(@section.course, @section)
  end

private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :order)
  end
end
