module AgeHelper
  def age_helper(member_dob)
    now = Time.now.utc.to_date
    dob = member_dob.to_date

    now.year - dob.year - (now.month > dob.month || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)

  end
end