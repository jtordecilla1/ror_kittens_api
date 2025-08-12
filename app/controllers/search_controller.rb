class SearchController < ApplicationController
  require "net/http"
  require "json"
  
  FLICKR_API_KEY = ENV.fetch("FLICKR_API_KEY")

  def index
    query = params[:query].presence || "cat"

    url = URI("https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{FLICKR_API_KEY}&text=#{CGI.escape(query)}&safe_search=1&per_page=100&format=json&nojsoncallback=1")
    data = call_flickr_api(url)

    if data["error"]
      flash[:error] = data["error"]
      redirect_to root_path and return
    end

    photo_array = data["photos"] && data["photos"]["photo"] ? data["photos"]["photo"] : []
  
    # Pagination parameters for the helper
    @per_page = 6
    @page = params[:page].to_i
    @page = 1 if @page < 1
    @total_entries = photo_array.size
    
    start_index = (@page - 1) * @per_page
    @photos = photo_array[start_index, @per_page] || []
    
    @search_query = query
  
    respond_to do |format|
      format.html
      format.json { render json: data }
    end
  end

  def show
    photo_id = params[:id]
    
    url = URI("https://www.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=#{FLICKR_API_KEY}&photo_id=#{photo_id}&format=json&nojsoncallback=1")
    data = call_flickr_api(url)

    if data["error"]
      flash[:error] = data["error"]
      redirect_to root_path and return
    end

    @photo = data["photo"] if data["photo"].present?
    
    respond_to do |format|
      format.html
      format.json { render json: data }
    end
  end

  private

  def search_params
    params.permit(:query, :page, :id)
  end

  def call_flickr_api(url)
    begin
      response = Net::HTTP.get(url)
      JSON.parse(response)
    rescue StandardError => e
      Rails.logger.error("Flickr API call failed: #{e.message}")
      {"error" => "Failed to retrieve data from Flickr API"}
    end
  end

end