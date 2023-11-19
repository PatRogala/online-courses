class WidgetRatingsController < ApplicationController
  def create
    if params[:widget_id]
      # find the widget
      # update its rating
      redirect_to widget_path(params[:widget_id]),
        notice: "Thanks for rating!"
    else
      head :bad_request
    end
  end
end
