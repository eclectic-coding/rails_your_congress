class Senator < ApplicationRecord
  include PgSearch

  scope :sorted, ->{ order(last_name: :asc) }

  pg_search_scope :global_search,
                  against: [:first_name, :last_name, :state],
                  using: { tsearch: { prefix: true } }
end
