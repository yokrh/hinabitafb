require 'character'

class Post < ActiveRecord::Base
  def self.create_with_post_data(data)
    create! do |post|
      post.post_id = data["id"]
      post.timestamp = data["created_time"]
      post.date = data["created_time"]
      post.name = Character.name_from_comment data["message"]
      post.face = Character.face_from_comment data["message"]
      post.comment = data["message"]
      post.link = data["link"]
      post.picture_url = data["picture"]
      post.full_picture_url = data["full_picture"]
      post.has_picture = Post.has_picture data
      post.has_video = Post.has_video data
      post.has_attachment = Post.has_attachment data
      post.other = ""
    end
  end

  def html_class
    Character.key_from_name self.name
  end

  private

  def self.has_attachment(data)
    return true if data["link"].present?  # fb_pic or youtube or itunes
    return true if data["story"].present?  # some share has no link
    false
  end

  def self.has_picture(data)
    return true if data["picture"].present?
    return true if data["full_picture"].present?
    false
  end

  def self.has_video(data)
    return false if data["link"].blank?
    data["link"].include? "youtube"
  end

end
