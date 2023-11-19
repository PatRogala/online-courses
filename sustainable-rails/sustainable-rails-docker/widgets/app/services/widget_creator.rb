class WidgetCreator
  def create_widget(widget)
    widget.widget_status = WidgetStatus.first
    widget.save

    Result.new(created: widget.valid?, widget: widget)
  end

  class Result
    attr_reader :widget

    def initialize(created:, widget:)
      @created = created
      @widget = widget
    end

    def created?
      @created
    end
  end
end
