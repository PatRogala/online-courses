class WidgetCreator
  def create_widget(widget)
    widget.widget_status = WidgetStatus.find_by!(name: "Fresh")
    widget.save

    if widget.price_cents > 7_500_00
      FinanceMailer.high_priced_widget(widget).deliver_now
    end

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
