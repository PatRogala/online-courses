// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"

// The default of 500ms is too long and
// users can lose the casual link between clicking
// a link and seeing the browser respons
Turbo.setProgressBarDelay(100)

import "controllers"
