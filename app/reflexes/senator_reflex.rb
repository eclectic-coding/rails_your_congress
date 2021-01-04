class SenatorReflex < StimulusReflex::Reflex

  def loyalist
    @senators = Senator.all
                       .order(votes_with_party_pct: :desc)

    uri = URI.parse([request.base_url, request.path].join)

    morph :nothing

    cable_ready
      .inner_html(selector: "#senators-container", html: render(partial: @senators))
      .push_state(url: uri.to_s)
      .broadcast
  end

end