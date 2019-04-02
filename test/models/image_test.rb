require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_image_is_valid
    image = Image.new(url: 'https://www.w3schools.com/w3css/img_lights.jpg')
    assert image.valid?
  end

  def test_image_is_invalid_without_url
    image = Image.new
    assert_not image.valid?, 'image is valid without a url'
    assert_not_nil image.errors[:url], 'no validation error for url present'
  end

  def test_invalid_with_null_url
    image = Image.new(url: nil)
    assert_not image.valid?, 'image is valid without a url'
    assert_not_nil image.errors[:url], 'no validation error for url present'
  end

  def test_invalid_with_bad_url
    image = Image.new(url: 'test')
    assert_not image.valid?
  end
end
