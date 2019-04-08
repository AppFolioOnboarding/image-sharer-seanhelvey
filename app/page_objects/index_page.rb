class IndexPage < AePageObjects::Document
  path :images

  def showing_all_images?
    node.find('.images').present?
  end
end
