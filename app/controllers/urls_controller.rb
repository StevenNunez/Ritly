class UrlsController < ApplicationController
  def create
    safe_url = params.require(:url).permit(:link)
    @url = Url.new(safe_url)
    @url.hash_code = SecureRandom.urlsafe_base64(8)
    @url.save
    redirect_to url_path(@url.id)
  end

  def show
    @url = Url.find params[:id]
  end

  def redirectors
    trv = params["some_totally_random_value"]
    u = Url.find_by hash_code: trv
    if u
      redirect_to u.link
    else
      redirect_to root_path
    end
  end

  def preview
    trv = params["some_totally_random_value"]
    @url = Url.find_by hash_code: trv
  end
end
