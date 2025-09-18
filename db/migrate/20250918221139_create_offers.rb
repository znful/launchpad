class CreateOffers < ActiveRecord::Migration[8.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.string :company_name, null: false
      t.string :title, null: false
      t.text :description
      t.string :address, null: false
      t.string :application_link, null: false
      t.integer :contract_type, null: false
      t.integer :job_type, null: false
      t.integer :verification_status
      t.integer :status

      t.timestamps
    end
  end
end
