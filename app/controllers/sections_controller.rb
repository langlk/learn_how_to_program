class SectionsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @section = @course.sections.new
  end

  def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.new(section_params)
    if @section.save
      flash[:notice] = "Section created!"
      redirect_to section_path(@section)
    else
      render :new
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      flash[:notice] = "Section updated!"
      redirect_to section_path(@section)
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @course = @section.course
    @section.lessons.each do |lesson|
      lesson.destroy
    end
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' has been deleted."
    redirect_to course_path(@course)
  end

private
  def section_params
    params.require(:section).permit(:name, :order)
  end
end
