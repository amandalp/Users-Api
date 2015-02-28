class CreateDefenseCheckins < ActiveRecord::Migration
  def change
    create_table :defense_checkins do |t|
      t.integer :user_id
      t.integer :defense_id

      t.timestamps null: false
    end
  end
end
