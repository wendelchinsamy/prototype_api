# frozen_string_literal: true

class LearningPathsController < ApplicationController
  before_action :set_learning_path, only: [:update, :destroy]
  before_action :set_show_learning_path, only: [:show]

  def index
    learning_paths = LearningPath.includes(:courses, :talents).all
    render(json: learning_paths, include: [:courses, :talents])
  end

  def show
    render(json: @learning_path, include: [:courses, :talents])
  end

  def create
    learning_path = LearningPath.new(learning_path_params)

    if learning_path.save
      render(json: learning_path, status: :created)
    else
      render_validation_errors(learning_path.errors)
    end
  end

  def update
    if @learning_path.update(learning_path_params)
      render(json: @learning_path)
    else
      render_validation_errors(@learning_path.errors)
    end
  end

  def destroy
    @learning_path.destroy!
  end

  private

  def learning_path_params
    params.require(:learning_path).permit(:name)
  end

  def set_learning_path
    @learning_path = LearningPath.find_by(id: params[:id])
    render(status: 404) if @learning_path.blank?
  end

  def set_show_learning_path
    @learning_path = LearningPath.includes(:courses, :talents).find_by(id: params[:id])
    render(status: 404) if @learning_path.blank?
  end
end
