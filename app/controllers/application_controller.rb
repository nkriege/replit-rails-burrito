class ApplicationController < ActionController::Base
  def colors
    render json: Color::COLORS
  end
end
