class CreateOpeningRules < ActiveRecord::Migration[5.0]
  def change
    create_table :opening_rules do |t|
      t.references :location, foreign_key: true
      t.integer :weekday
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
