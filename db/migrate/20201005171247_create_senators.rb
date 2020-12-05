class CreateSenators < ActiveRecord::Migration[6.0]
  def change
    create_table :senators do |t|
      t.string :chamber
      t.string :member_id
      t.string :title
      t.string :short_title
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :gender
      t.string :party
      t.string :party_full_name
      t.integer :age
      t.string :twitter_account
      t.string :facebook_account
      t.string :youtube_account
      t.string :website
      t.string :contact_form
      t.integer :seniority
      t.string :next_election
      t.string :office
      t.string :phone
      t.string :state
      t.decimal :missed_votes_pct
      t.decimal :votes_with_party_pct
      t.string :begin_date
      t.string :end_date
      t.string :status
      t.string :note

      t.timestamps
    end
  end
end
