require 'test_helper'

class SaveImageLinkTest < ActionDispatch::IntegrationTest
  def test_link_is_visible
    get '/'
    assert_select "a:match('href', ?)", %r{images/new}
  end

  def test_form_is_visible
    get '/images/new'
    assert_select 'form', 1
  end
end
