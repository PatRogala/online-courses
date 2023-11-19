require "application_system_test_case"

class ViewWidgetTest < ApplicationSystemTestCase
  test "we can see a list of widgets and view one" do
    visit widgets_path

    widget_name = "stembolt"
    widget_name_regexp = /#{widget_name}/i

    assert_selector "ul li", text: /flux capacitor/i
    assert_selector "ul li", text: widget_name_regexp

    find("ul li", text: widget_name_regexp).find("a").click

    # remember, 1234 is formatted as 12.34
    formatted_widget_id_regexp = /12\.34/

    assert_selector "h1", text: widget_name_regexp
    assert_selector "h2", text: formatted_widget_id_regexp
  end
end
