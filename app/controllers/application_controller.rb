class ApplicationController < ActionController::Base
  before_action :find_period
  before_action :find_chart

  private

  def find_period
    @period = Period.parse(params[:period])
  end

  def find_chart
    @chart = "Solaris::Charts::#{params[:chart].camelize}".constantize.new(@period) if params[:chart].present?
  end

  helper_method def default_chart
    Solaris::Charts.for_period(@period).first&.id
  end
end
