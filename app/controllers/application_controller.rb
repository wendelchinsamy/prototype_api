# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_validation_errors(errors)
    render(json: { errors: }, status: :unprocessable_entity)
  end
end
