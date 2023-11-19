class WidgetsController < ApplicationController
  def new
    @widget = Widget.new
    @manufacturers = Manufacturer.all
  end

  def create
    widget_params = params.require(:widget).permit(:name, :price_cents, :manufacturer_id)
    if widget_params[:price_cents].present?
      widget_params[:price_cents] = (
        BigDecimal(widget_params[:price_cents]) * 100
      ).to_i
    end

    result = WidgetCreator.new.create_widget(Widget.new(widget_params))

    if result.created?
      redirect_to widget_path(result.widget)
    else
      @widget = result.widget
      @manufacturers = Manufacturer.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @widget = Widget.find(params[:id])
  end

  def index
    @widgets = [
      OpenStruct.new(id: 1234, name: "Stembolt"),
      OpenStruct.new(id: 2, name: "Flux Capacitor")
    ]
end
