class CreateDefenses < ActiveRecord::Migration
  def change
    create_table :defenses do |t|
      t.integer :user_id
      t.string :body

      t.timestamps null: false
    end
  end
end
