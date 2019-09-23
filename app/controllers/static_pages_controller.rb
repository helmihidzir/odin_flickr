require 'flickraw'

class StaticPagesController < ApplicationController

  def index
    @static_page = StaticPage.new
    @photos
  end

  def create
    @static_page = StaticPage.new(static_pages_params)
    if @static_page.save
      flickr = FlickRaw::Flickr.new(api_key: ENV['FLICKRAW_API_KEY'], shared_secret: ENV['FLICKRAW_SHARED_SECRET'])
      @photos = flickr.people.getPhotosOf(user_id: params[:static_page][:user_id])
      # redirect_to "http://farm#{@photos[0]["farm"]}.staticflickr.com/#{@photos[0]["server"]}/#{@photos[0]["id"]}_#{@photos[0]["secret"]}.jpg"
      render :show
    else
      false
    end
  end

  def show
    @photos
  end

  private

  def static_pages_params
    params.require(:static_page).permit(:user_id)
  end
end
