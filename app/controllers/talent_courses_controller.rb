# frozen_string_literal: true

class TalentCoursesController < ApplicationController
  before_action :set_talent, only: [:index]

  def index
    render(json: @talent, include: [:course_talents])
  end

  private

  def set_talent
    @talent = Talent.includes(:course_talents).find_by(id: params[:talent_id])
    render(status: 404) if @talent.blank?
  end
end
