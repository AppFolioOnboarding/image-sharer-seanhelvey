ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def create_image!(url: 'https://www.w3schools.com/w3css/img_lights.jpg', tag_list: 'lights')
      Image.create url: url, tag_list: tag_list
    end
  end
end
