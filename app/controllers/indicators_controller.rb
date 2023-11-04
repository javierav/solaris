class IndicatorsController < ApplicationController
  def show
    @indicator = "Solaris::Indicators::#{params[:indicator].camelize}".constantize.new(@period)

    render partial: "indicators/indicator"
  end
end
