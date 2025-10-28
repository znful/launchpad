class CreateStatistics < ActiveRecord::Migration[8.0]
  def change
    create_table :statistics, id: :uuid do |t|
      t.string :location
      t.integer :stat_type
      t.references :offer, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
