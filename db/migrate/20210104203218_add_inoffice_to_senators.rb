class AddInofficeToSenators < ActiveRecord::Migration[6.0]
  def change
    add_column :senators, :in_office, :boolean
  end
end
