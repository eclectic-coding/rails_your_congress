class RepresentativesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @representatives = pagy(Representative.all)
  end

  def show
    @representative = Representative.find_by_member_id(params[:id])
  end
end
