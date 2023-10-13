class ChartsController < ApplicationController
  before_action :find_period
  before_action :find_chart_id

  def show
    @chart_data, @chart_options = chart_class.new(@period).run

    render partial: "charts/chart"
  end

  private

  def find_period
    @period = Period.new(params[:period])
  end

  def chart_class
    "Solaris::Charts::#{params[:chart].camelize}".constantize
  end

  def find_chart_id
    @chart_id = "#{params[:chart]}_chart"
  end
end
