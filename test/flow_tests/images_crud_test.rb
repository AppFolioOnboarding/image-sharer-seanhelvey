require 'flow_test_helper'

class ImagesCrudTest < FlowTestCase
  def test_image__accept_alert
    @image = create_image!
    show_page = ShowPage.visit @image.id
    show_page.delete_image!
    show_page.accept_alert!
    index_page = show_page.go_back_to_index!
    assert index_page.showing_all_images?
  end

  def test_image__decline_alert
    @image = create_image!
    show_page = ShowPage.visit @image.id
    show_page.delete_image!
    show_page.decline_alert!
    assert_equal 1, show_page.image_count
  end
end
