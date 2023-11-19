require "test_helper"

class WidgetCreatorTest < ActiveSupport::TestCase
  setup do
    ActionMailer::Base.deliveries = []
    @widget_creator = WidgetCreator.new
    @manufacturer = FactoryBot.create(:manufacturer, created_at: 1.day.ago)
    FactoryBot.create(:widget_status)
    FactoryBot.create(:widget_status, name: "Fresh")
  end

  test "widgets have a default status of 'Fresh'" do
    result = @widget_creator.create_widget(Widget.new(
      name: "Stembolt",
      price_cents: 1_000_00,
      manufacturer_id: @manufacturer.id
    ))

    assert result.created?
    assert_equal Widget.first, result.widget
    assert_equal "Fresh",result.widget.widget_status.name
    assert_equal 0, ActionMailer::Base.deliveries.size
  end

  test "widget names must be 5 characters or greater" do
    result = @widget_creator.create_widget(Widget.new(
      name: "widg",
      price_cents: 1_000_00,
      manufacturer_id: @manufacturer.id
    ))

    refute result.created?

    assert result.widget.invalid?

    too_short_error = result.widget.errors[:name].
      detect { |message|

      message =~ /is too short/i

    }

    refute_nil too_short_error,
      result.widget.errors.full_messages.join(",")
  end

  test "finance is notified for widgets priced over $7,500" do
    result = @widget_creator.create_widget(Widget.new(
      name: "Stembolt",
      price_cents: 7_500_01,
      manufacturer_id: @manufacturer.id
    ))

    assert result.created?
    assert_equal 1, ActionMailer::Base.deliveries.size
    mail_message = ActionMailer::Base.deliveries.first
    assert_equal "finance@example.com", mail_message["to"].to_s
    assert_match /Stembolt/, mail_message.text_part.to_s
  end
end
