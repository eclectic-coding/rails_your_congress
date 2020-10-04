module PhoneHelper
  def phone_helper(member_phone)
    member_phone.to_s.gsub('-', '')
  end
end