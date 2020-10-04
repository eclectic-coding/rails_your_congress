module FacebookHelper

  def facebook_helper(member_facebook)
    'https://www.facebook.com/' + member_facebook.to_s
  end

end