# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update]
  before_action :set_author_with_courses, only: [:show, :destroy]

  def index
    render(json: Author.includes(:courses).all, include: [:courses])
  end

  def show
    render(json: @author, include: [:courses])
  end

  def create
    author = Author.new(author_params)

    if author.save
      render(json: author, status: :created)
    else
      render_validation_errors(author.errors)
    end
  end

  def update
    if @author.update(author_params)
      render(json: @author)
    else
      render_validation_errors(@author.errors)
    end
  end

  def destroy
    unless Author.exists?(author_params[:new_author_id])
      render(json: { message: "new_author_id is invalid" }, status: :bad_request) and return
    end

    update_course_authors
    @author.reload
    @author.destroy!
  end

  private

  def author_params
    params.require(:author).permit(:name, :new_author_id)
  end

  def set_author
    @author = Author.find_by(id: params[:id])
    render(status: :not_found) if @author.blank?
  end

  def set_author_with_courses
    @author = Author.includes(:courses).find_by(id: params[:id])
    render(status: :not_found) if @author.blank?
  end

  def update_course_authors
    @author.courses.each do |course|
      course.update!(author_id: author_params[:new_author_id])
    end
  end
end
