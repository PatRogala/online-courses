class FinanceMailer < ApplicationMailer
  def high_priced_widget(widget)
    @widget = widget
    mail to: "finance@example.com"
  end
end
