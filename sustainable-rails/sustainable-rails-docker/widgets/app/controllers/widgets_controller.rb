class WidgetsController < ApplicationController
  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: "Sector 7G",
      address: OpenStruct.new(
        id: rand(100),
        country: "UK"
      )
    )
    widget_name = if params[:id].to_i == 1234
                    "Stembolt"
                  else
                    "Widget #{params[:id]}"
                  end
    @widget = OpenStruct.new(id: params[:id],
                              manufacturer_id: rand(100),
                              manufacturer: manufacturer,
                              name: widget_name)

    def @widget.widget_id
      if self.id.to_s.length < 3
        self.id.to_s
      else
        self.id.to_s[0..-3] + "." +
          self.id.to_s[-2..-1]
      end
    end
  end

  def index
    @widgets = [
      OpenStruct.new(id: 1234, name: "Stembolt"),
      OpenStruct.new(id: 2, name: "Flux Capacitor")
    ]
end
