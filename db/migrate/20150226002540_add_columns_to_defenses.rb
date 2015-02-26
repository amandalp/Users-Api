class AddColumnsToDefenses < ActiveRecord::Migration
  def change
  	add_column :defenses, :body2, :string
  	add_column :defenses, :body3, :string
  	add_column :defenses, :body4, :string
  	add_column :defenses, :body5, :string
  end
end
