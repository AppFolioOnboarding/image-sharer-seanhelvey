require 'test_helper'

class ImageRoutesTest < ActionDispatch::IntegrationTest
  def test_link__visible
    get '/'
    assert_select "a:match('href', ?)", %r{images/new}
  end

  def test_form__visible
    get '/images/new'
    assert_select 'form', 1
  end

  def test_index
    get '/images'
    assert_select 'img', Image.all.count
  end
end
