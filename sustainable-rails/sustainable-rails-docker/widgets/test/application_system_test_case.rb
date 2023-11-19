require "test_helper"
require "support/with_clues"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include TestSupport::WithClues
  driven_by :rack_test
end
