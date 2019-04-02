require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_create_image
    assert_difference('Image.count') do
      post images_url, params: { image: { url: 'https://www.w3schools.com/w3css/img_lights.jpg' } }
    end

    assert_redirected_to image_path(Image.last)
  end

  def test_invalid_image
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: 'test' } }
    end

    assert_response :success
  end

  def test_show_image
    image = images(:one)
    get image_url(image)
    assert_response :success
  end
end
