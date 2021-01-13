require 'net/http'
require 'uri'

module BioImageHelper

  def bioimage_helper(member)
    img_url = "https://theunitedstates.io/images/congress/225x275/#{member}.jpg"
    res = Net::HTTP.get_response(URI.parse(img_url.to_s))

    res.is_a?(Net::HTTPSuccess) ? img_url : 'backup.png'
  end

end