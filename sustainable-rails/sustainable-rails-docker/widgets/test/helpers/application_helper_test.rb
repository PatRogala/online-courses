require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "styled_widget_id" do
    rendered_component = styled_widget_id("1.23")

    regexp = %r{
      <span   # match a span tag
      [^>]*   # ignore anything that isn't >
      >       # match the > to close the opening tag
      .*      # anything at all in here (e.g. other tags)
      1\.23   # the widget ID we expect, escaping the dot
      .*      # anything after it (e.g. other tags)
      </span> # closing span tag
    }x

    assert_match regexp, rendered_component
    assert rendered_component.html_safe?
  end

  test "widget_rating_component with CTA" do
    widget = OpenStruct.new(id: 1234)
    rendered_component = widget_rating_component(
                          widget,
                          suppress_cta: false)
    assert_match /<section/m, rendered_component
    assert rendered_component.html_safe?
  end

  test "widget_rating_component without CTA" do
    widget = OpenStruct.new(id: 1234)
    rendered_component = widget_rating_component(
                          widget,
                          suppress_cta: true)
    assert_match /<section/m, rendered_component
    assert rendered_component.html_safe?
  end
end
