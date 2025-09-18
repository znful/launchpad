class CreateOffers < ActiveRecord::Migration[8.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.string :company_name
      t.string :title
      t.text :description
      t.string :address
      t.string :application_link
      t.integer :contract_type
      t.integer :job_type
      t.integer :verification_status
      t.integer :status

      t.timestamps
    end
  end
end
