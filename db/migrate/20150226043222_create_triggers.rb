class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.integer :user_id
      t.string :body
      t.boolean :isChecked

      t.timestamps null: false
    end
  end
end
