class WidgetRatingsController < ApplicationController
  def create
    if params[:widget_id]
      # find the widget
      # update its rating
      # default render
    else
      head :bad_request
    end
  end
end
