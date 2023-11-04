class PeriodsController < ApplicationController
  def index
    if turbo_frame_request?
      render partial: "chart"
    else
      render "index"
    end
  end
end
