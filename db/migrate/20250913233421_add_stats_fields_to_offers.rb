class AddStatsFieldsToOffers < ActiveRecord::Migration[8.0]
  def change
    add_column :offers, :status, :integer
    add_column :offers, :verification_status, :integer
    add_column :offers, :published, :boolean
    add_column :offers, :view_count, :integer
    add_column :offers, :interaction_count, :integer
    add_column :offers, :apply_count, :integer
  end
end
