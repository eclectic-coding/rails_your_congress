class SenatorsController < ApplicationController

  def index
    if params[:query].present?
      @senator_search = Senator.global_search(params[:query])
      @senators = @senator_search.paginate(page: params[:page], per_page: 20)
    else
      @senators = Senator.paginate(page: params[:page], per_page: 20)
    end

    respond_to do |format|
      format.html
      format.json { render json: { senators: @senators } }
    end
  end

  def show
    @senator = Senator.find_by_member_id(params[:id])
  end
end
