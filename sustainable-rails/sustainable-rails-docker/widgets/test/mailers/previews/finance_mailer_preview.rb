# Preview all emails at http://localhost:3000/rails/mailers/finance_mailer
class FinanceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/finance_mailer/high_priced_widget
  def high_priced_widget
    FinanceMailer.high_priced_widget
  end

end
