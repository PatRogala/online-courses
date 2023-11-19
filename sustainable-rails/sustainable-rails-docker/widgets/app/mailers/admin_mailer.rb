class AdminMailer < ApplicationMailer
  def new_widget_from_new_manufacturer(widget)
    @widget = widget
    mail to: "admin@example.com"
  end
end
