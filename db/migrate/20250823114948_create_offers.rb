class CreateOffers < ActiveRecord::Migration[8.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
