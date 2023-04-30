# frozen_string_literal: true

class TalentLearningPathsController < ApplicationController
  before_action :set_talent_learning_path, only: [:destroy]

  def create
    talent_learning_path = TalentLearningPath.create(create_params)

    if talent_learning_path.save
      render(json: talent_learning_path, status: :created)
    else
      render_validation_errors(talent_learning_path.errors)
    end
  end

  def destroy
    @talent_learning_path.destroy!
  end

  private

  def create_params
    params
      .require(:talent_learning_path)
      .permit(:learning_path_id)
      .merge({ talent_id: })
  end

  def set_talent_learning_path
    @talent_learning_path = TalentLearningPath.find_by(talent_id:, learning_path_id:)
    render(status: 404) if @talent_learning_path.blank?
  end

  def talent_id
    params[:talent_id]
  end

  def learning_path_id
    params[:id]
  end
end
