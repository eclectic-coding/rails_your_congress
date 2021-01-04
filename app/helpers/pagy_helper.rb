module PagyHelper
  include Pagy::Frontend

  def prev_page
    @pagy.prev || 1
  end

  def next_page
    @pagy.next || @pagy.last
  end

end
