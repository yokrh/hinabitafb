require 'uri'

module HinabitaHelper
  def text_url_to_link(text)
    begin
      URI.extract(text).uniq.each do |url|
        sub_text = ""
        sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
        text.gsub!(url, sub_text)
      end
    rescue
      return text
    end
    text.html_safe
  end
end
