class SenatorReflex < StimulusReflex::Reflex

  def loyalist
    @senators = Senator.all.order(votes_with_party_pct: :desc)
  end

end