require 'test_helper'

class SaveImageLinkTest < ActionDispatch::IntegrationTest
  def test_link__visible
    get '/'
    assert_select "a:match('href', ?)", %r{images/new}
  end

  def test_form__visible
    get '/images/new'
    assert_select 'form', 1
  end
end
