module ApplicationHelper
  def widget_rating_component(widget, suppress_cta: false)
    render partial: "widgets/rating",
           locals: { widget: widget, suppress_cta: suppress_cta }
  end
end
