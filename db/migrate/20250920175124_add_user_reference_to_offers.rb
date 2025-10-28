class AddUserReferenceToOffers < ActiveRecord::Migration[8.0]
  def change
    add_reference :offers, :user, null: false, foreign_key: true, type: :uuid
  end
end
