class Senator < ApplicationRecord
  include PgSearch

  scope :sorted, ->{ order(last_name: :asc) }

  pg_search_scope :search,
                  against: [
                    :first_name,
                    :last_name,
                    :state
                  ],
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }

  def self.perform_search(keyword)
    if keyword.present?
      Senator.search(keyword)
    else
      Senator.paginate(page: params[:page], per_page: 20)
    end.sorted
  end
end
