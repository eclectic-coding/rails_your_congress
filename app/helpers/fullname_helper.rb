module FullnameHelper

  def fullname_helper(member)
    member.short_title + ' ' + member.first_name + ' ' + member.last_name
  end

end