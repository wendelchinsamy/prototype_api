# frozen_string_literal: true

class TalentsController < ApplicationController
  before_action :set_talent, only: [:update, :destroy]
  before_action :set_show_talent, only: [:show]

  def index
    talents = Talent.includes(:author, :courses, :learning_paths)
    render(json: talents, include: [:author, :courses, :learning_paths])
  end

  def show
    render(json: @talent, include: [:author, :courses, :learning_paths])
  end

  def create
    talent = Talent.new(talent_params)

    if talent.save
      render(json: talent, status: :created)
    else
      render_validation_errors(talent.errors)
    end
  end

  def update
    if @talent.update(talent_params)
      render(json: @talent)
    else
      render_validation_errors(@talent.errors)
    end
  end

  def destroy
    @talent.destroy!
  end

  private

  def talent_params
    params.require(:talent).permit(:name, :author_id)
  end

  def set_talent
    @talent = Talent.find_by(id: params[:id])
    render(status: :not_found) if @talent.blank?
  end

  def set_show_talent
    @talent = Talent.includes(:author, :courses, :learning_paths).find_by(id: params[:id])
    render(status: :not_found) if @talent.blank?
  end
end
