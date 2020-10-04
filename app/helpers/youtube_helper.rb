module YoutubeHelper

  def youtube_helper(member_youtube)
    'https://www.youtube.com/user/' + member_youtube.to_s
  end

end