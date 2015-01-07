class PhotosController < ApplicationController
  def index
    @page_title = 'Photos'
    @photos = get_photos
  end

  private

  def get_photos
    Rails.cache.fetch("instagram_photos", expires_in: 1.hour) do
      get_photos_real
    end
  end

  def get_photos_real
    client = Instagram.client(:access_token => Rails.application.secrets.instagram_access_token)
    client.user_recent_media({:count => 1000}).map do |e|
      caption = e.caption ? e.caption.text : nil
      {
          caption: caption,
          link: e.link,
          thumbnail: e.images.thumbnail.url
      }
    end
  end

end
