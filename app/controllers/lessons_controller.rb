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
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = "Lesson updated!"
      redirect_to lesson_path(@lesson)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @section = @lesson.section
    @lesson.destroy
    flash[:notice] = "Lesson '#{@lesson.name}' has been deleted."
    redirect_to section_path(@section)
  end

private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :order)
  end
end
