class SenatorsController < ApplicationController

  def index
    if params[:search].present?
      @sens = Senator.perform_search(params[:search])
      @senators = @sens.paginate(page: params[:page], per_page: 20)
    else
      @senators = Senator.paginate(page: params[:page], per_page: 20)
    end
  end

  def show
    @senator = Senator.find_by_member_id(params[:id])
  end
end
