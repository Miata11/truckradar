module MetaTagsHelper

  DEFAULT_META = {
    "meta_title" => "Default Title",
    "meta_description" => "Default Description",
    "meta_image" => "default_image.jpg" # Define the default image here
  }

  def meta_title
  content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
  content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
  meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
  # petite modification pour que cela fonctionne aussi bien avec un asset qu'avec une url
  meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
  end
