module FullpartyHelper

  def fullparty_helper(member_party)
    if member_party == 'D'
      'Democrat'
    elsif member_party == 'R'
      'Republican'
    else
      'Independent'
    end
  end

end