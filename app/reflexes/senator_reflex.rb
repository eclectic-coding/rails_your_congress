class SenatorReflex < StimulusReflex::Reflex
  include Pagy::Backend

  def paginate
    params[:page] = element.dataset[:page].to_i
  end

  def loyalist
    senators = Senator.all.order(votes_with_party_pct: :desc)
    @page_count = (senators.count / Pagy::VARS[:items].to_f).ceil

    @page = (params[:page] || 1).to_i
    @page = @page_count if @page > @page_count
    @page = 1 if @page < 1
    @pagy, @senators = pagy(senators)

    uri = URI.parse([request.base_url, request.path].join)

    morph :nothing

    cable_ready
      .inner_html(selector: "#senators-container", html: render(partial: @senators))
      .push_state(url: uri.to_s)
      .broadcast
  end

end