class NewPage < AePageObjects::Document
  path :image

  def create_image!
    node.fill_in('Url', with: 'https://www.w3schools.com/w3css/img_lights.jpg')
    node.click_on('Upload Photo')
  end
end
