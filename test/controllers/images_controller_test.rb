require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_create__fails_without_tag
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: 'https://www.w3schools.com/w3css/img_lights.jpg' } }
    end

    assert_response :success
  end

  def test_create__with_one_tag
    assert_difference('Image.count') do
      post images_url, params: { image: { url: 'https://www.w3schools.com/w3css/img_lights.jpg', tag_list: 'awesome' } }
    end

    assert_redirected_to image_path(Image.last)
    assert Image.last.tag_list.include? 'awesome'
  end

  def test_create__with_multiple_tags
    assert_difference('Image.count') do
      post images_url, params: { image: { url: 'https://www.w3schools.com/w3css/img_lights.jpg', tag_list: 'awesome, yeah' } }
    end

    assert_redirected_to image_path(Image.last)
    assert Image.last.tag_list.include? 'awesome'
    assert Image.last.tag_list.include? 'yeah'
  end

  def test_create__with_invalid_tags
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: 'https://www.w3schools.com/w3css/img_lights.jpg', tag_list: ',,,' } }
    end

    assert_response :success
  end

  def test_create__fail_invalid_url
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: 'test', tag_list: 'awesome' } }
    end

    assert_response :success
  end

  def test_show
    image = create_image!
    get image_url(image)
    assert_response :success
  end

  def test_index__without_params
    get images_url
    assert_response :success
  end

  def test_index__with_params
    create_image!
    create_image!(url: 'https://dphhs.mt.gov/portals/85/hcsd/images/childcare/STARS/STARS%20Only.png', tag_list: 'stars')

    get images_url(tag: 'stars')
    assert_response :success
    assert_select 'img', 1
  end

  def test_destroy
    image = create_image!
    assert_difference('Image.count', -1) do
      assert_difference('ActsAsTaggableOn::Tagging.count', -1) do
        delete image_url(image)
      end
    end
  end
end
