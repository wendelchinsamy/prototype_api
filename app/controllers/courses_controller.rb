# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: [:update, :destroy]
  before_action :set_course_with_associations, only: [:show]

  def index
    courses = Course.includes(:author, :learning_path, :talents).all
    render(json: courses, include: [:author, :learning_path, :talents])
  end

  def show
    render(json: @course, include: [:author, :learning_path, :talents])
  end

  def create
    course = Course.new(course_params)

    if course.save
      render(json: course, status: :created)
    else
      render_validation_errors(course.errors)
    end
  end

  def update
    if @course.update(course_params)
      render(json: @course)
    else
      render_validation_errors(@course.errors)
    end
  end

  def destroy
    @course.destroy!
  end

  private

  def course_params
    params.require(:course).permit(:name, :author_id, :learning_path_id)
  end

  def set_course
    @course = Course.find_by(id: params[:id])
    render(status: :not_found) if @course.blank?
  end

  def set_course_with_associations
    @course = Course.includes(:author, :learning_path, :talents).find_by(id: params[:id])
    render(status: :not_found) if @course.blank?
  end
end
