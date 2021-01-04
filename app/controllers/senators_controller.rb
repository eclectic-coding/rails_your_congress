class SenatorsController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @senators = pagy(Senator.all)
  end

  def show
    @senator = Senator.find_by_member_id(params[:id])
  end

end
