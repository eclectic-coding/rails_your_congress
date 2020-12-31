class SenatorsController < ApplicationController

  def index
      @senators = Senator.paginate(page: params[:page], per_page: 20)
  end

  def show
    @senator = Senator.find_by_member_id(params[:id])
  end
end
