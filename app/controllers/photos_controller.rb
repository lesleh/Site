class PhotosController < ApplicationController
  def index
    @page_title = 'Photos'
    @photos = get_photos
  end

  private

  def get_photos
    Rails.cache.fetch("instagram_photos", expires_in: 24.hours) do
      get_photos_real
    end
  end

  def get_photos_real
    client = Instagram.client(:access_token => Rails.application.secrets.instagram_access_token)

    photos = []
    next_max_id = nil
    loop do
      data = client.user_recent_media('self', count: 100, max_id: next_max_id)
      photos.concat( data.map {|e| parse_photo(e)} )

      next_max_id = data.pagination.next_max_id
      break if next_max_id == nil
    end

    photos
  end

  def parse_photo(photo)
    caption = photo.caption ? photo.caption.text : nil
    {
        caption: caption,
        link: photo.link,
        image: photo.images.standard_resolution.url.gsub(/^http/, 'https'),
        thumbnail: photo.images.thumbnail.url.gsub(/^http/, 'https')
    }
  end

end
