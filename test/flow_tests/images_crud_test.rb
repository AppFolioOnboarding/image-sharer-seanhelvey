require 'flow_test_helper'

class ImagesCrudTest < FlowTestCase
  def test_image__accept_alert
    @image = Image.create url: 'https://www.w3schools.com/w3css/img_lights.jpg'
    show_page = ShowPage.visit @image.id
    show_page.delete_image!
    show_page.accept_alert!
    index_page = show_page.go_back_to_index!
    assert index_page.showing_all_images?
  end

  def test_image__decline_alert
    @image = Image.create url: 'https://www.w3schools.com/w3css/img_lights.jpg'
    show_page = ShowPage.visit @image.id
    show_page.delete_image!
    show_page.decline_alert!
    assert_equal 1, show_page.image_count
  end
end
