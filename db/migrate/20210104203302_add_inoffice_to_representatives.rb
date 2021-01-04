class AddInofficeToRepresentatives < ActiveRecord::Migration[6.0]
  def change
    add_column :representatives, :in_office, :boolean
  end
end
