class ShowPage < AePageObjects::Document
  path :image

  element :image, item_locator: [:css, '.img']

  def delete_image!
    node.click_on('Delete Image')
  end

  def accept_alert!
    node.accept_alert
  end

  def decline_alert!
    node.dismiss_confirm
  end

  def go_back_to_index!
    window.change_to(IndexPage)
  end

  def image_count
    node.find_all('.img').count
  end
end
