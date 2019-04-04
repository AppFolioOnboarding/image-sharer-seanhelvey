require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_create__succeed
    assert_difference('Image.count') do
      post images_url, params: { image: { url: 'https://www.w3schools.com/w3css/img_lights.jpg' } }
    end

    assert_redirected_to image_path(Image.last)
  end

  def test_create__fail_invalid_url
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: 'test' } }
    end

    assert_response :success
  end

  def test_show
    image = images(:one)
    get image_url(image)
    assert_response :success
  end

  def test_index
    get images_url
    assert_response :success
  end
end
