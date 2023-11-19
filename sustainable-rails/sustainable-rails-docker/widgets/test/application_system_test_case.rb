require "test_helper"

Capybara.register_driver :root_headless_chrome do |app|
  capabilities =
    Selenium::WebDriver::Remote::Capabilities.chome(
      "goog:chromeOptions": {
        args: [
          "headles",
          "disable-gpu",
          "no-sandbox",
          "disable-dev-shm-usage",
          "whitelisted-ips"
        ]
      },
      "goog:loggingPrefs": { browser: "ALL" }
    )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    capabilities: capabilities)
end # register_driver

require "support/with_clues"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include TestSupport::WithClues
  driven_by :rack_test
end


# Use this as the base class for system tests that require
# JavaScript or that otherwise need a real browser
class BrowserSystemTestCase < ApplicationSystemTestCase
  driven_by :root_headless_chrome, screen_size: [ 1400, 1400 ]
end
