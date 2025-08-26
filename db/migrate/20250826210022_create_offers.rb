class CreateOffers < ActiveRecord::Migration[8.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.string :company_name
      t.string :title
      t.text :description
      t.string :city
      t.string :country
      t.string :apply_link
      t.integer :contract_type
      t.integer :job_type
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
