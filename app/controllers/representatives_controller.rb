class RepresentativesController < ApplicationController

  def index
    @representatives = Representative.paginate(page: params[:page], per_page: 20)
  end

  def show
    @representative = Representative.find_by_member_id(params[:id])
  end

end
