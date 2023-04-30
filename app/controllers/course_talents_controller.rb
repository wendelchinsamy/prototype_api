# frozen_string_literal: true

class CourseTalentsController < ApplicationController
  before_action :set_course_talent, only: [:update, :destroy]

  def create
    course_talent = CourseTalent.new(create_params)

    if course_talent.save
      render(json: course_talent, status: :created)
    else
      render_validation_errors(course_talent.errors)
    end
  end

  def update
    result = @course_talent.update({ completed: true })

    # Exit if there errors
    render_validation_errors(@course_talent.errors) and return unless result

    next_course_id = fetch_next_course_id

    # If we cannot assign the next course in the learning path
    render(json: @course_talent) and return unless assign_next_course?(next_course_id)

    # Assign next course to talent
    next_course_talent = CourseTalent.new(
      course_id: next_course_id,
      talent_id: @course_talent.talent_id,
      completed: false,
    )

    if next_course_talent.save
      render(json: { course_talent: @course_talent, next_course_talent: })
    else
      render_validation_errors(next_course_talent.errors)
    end
  end

  def destroy
    @course_talent.destroy!
  end

  private

  def create_params
    params
      .require(:course_talent)
      .permit(:talent_id)
      .merge({ course_id:, completed: false })
  end

  def set_course_talent
    @course_talent = CourseTalent.find_by(course_id:, talent_id:)
    render(status: 404) if @course_talent.blank?
  end

  def course_id
    params[:course_id]
  end

  def talent_id
    params[:id]
  end

  def fetch_next_course_id
    Course.next_course_id_in_path(@course_talent.course.learning_path_id, @course_talent.course.created_at)
  end

  def assign_next_course?(next_course_id)
    if next_course_id
      !CourseTalent.exists?(course_id: next_course_id, talent_id: @course_talent.talent_id)
    else
      false
    end
  end
end
