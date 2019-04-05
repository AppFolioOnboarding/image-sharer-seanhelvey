require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_image__valid
    image = Image.new(url: 'https://www.w3schools.com/w3css/img_lights.jpg')
    assert image.valid?
  end

  def test_image__invalid_without_url
    image = Image.new
    assert_not image.valid?, 'image is valid without a url'
    assert_not_nil image.errors[:url], 'no validation error for url present'
  end

  def test_image__invalid_with_null_url
    image = Image.new(url: nil)
    assert_not image.valid?, 'image is valid without a url'
    assert_not_nil image.errors[:url], 'no validation error for url present'
  end

  def test_image__invalid_with_bad_url
    image = Image.new(url: 'test')
    assert_not image.valid?
  end

  def test_image__recent_in_order
    older_image = Image.create(url: 'https://www.w3schools.com/w3css/img_lights.jpg')
    newer_image = Image.create(url: 'https://www.w3schools.com/w3css/img_lights.jpg')

    assert_equal [newer_image, older_image], Image.recent.to_a.first(2)
  end

  def test_image__add_remove_tags
    image = Image.new(url: 'https://www.w3schools.com/w3css/img_lights.jpg')
    assert image.valid?
    assert image.tag_list.empty?

    image.tag_list.add('awesome')
    assert image.tag_list.include? 'awesome'

    image.tag_list.remove('awesome')
    assert image.tag_list.empty?
  end
end
