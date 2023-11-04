class ChartsController < ApplicationController
  def show
    render partial: "charts/chart"
  end

  private

  helper_method def available_charts
    Solaris::Charts.for_period(@period).map do |chart|
      {
        name: t("charts.#{chart.id}"),
        href: periods_path(chart: chart.id, period: @period),
        current: chart.id == @chart.id
      }
    end
  end
end
