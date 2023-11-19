require "test_helper"

class WidgetTest < ActiveSupport::TestCase
  setup do
    @widget = FactoryBot.create(:widget)
  end

  test "valid prices do not trigger the DB constraint" do
    assert_nothing_raised do
      @widget.update_column(
        :price_cents, 45_00
      )
    end
  end

  test "negative prices do trigger the DB constraint" do
    ex = assert_raises do
      @widget.update_column(
        :price_cents, -45_00
      )
    end

    assert_match(/price_must_be_positive/i,ex.message)
  end
end
