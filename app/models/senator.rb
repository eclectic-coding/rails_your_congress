class Senator < ApplicationRecord
  scope :sorted, -> { order(last_name: :asc) }

end
