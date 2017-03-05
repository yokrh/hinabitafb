require "net/http"
require "uri"
require "json"

class HinabitaController < ApplicationController
  # ひなビタ♪ブログ
  def biography
    page = "hinabitter"
    api = "feed"
    fields = "created_time,message,link,story,picture,full_picture"
    limit = "100"
    limit = "10"
    access_token = Settings.access_token
    unless uri = params[:uri] then
      uri = "https://graph.facebook.com/v2.8/" + page + "/" + api;
      uri += "?fields=" + fields + "&limit=" + limit + "&access_token=" + access_token
    end

    uri = URI.parse(uri)
    json = Net::HTTP.get(uri)
    res = JSON.parse(json)
    #puts res

    @posts = []
    res["data"].each do |data|
      post = Post.find_by_post_id(data["id"])
      unless post || Character.know(post)
        post = Post.create_with_post_data data
      end
      @posts << post
    end

    @pg_prev = res["paging"]["previous"] if res["paging"].present?
    @pg_next = res["paging"]["next"] if res["paging"].present?
    @from_date = Date.today.prev_month
    @to_date = Date.today
  end
end
