class DeleteColumnsFromDefenses < ActiveRecord::Migration
  def change
  	remove_column :defenses, :body2, :string
  	remove_column :defenses, :body3, :string
  	remove_column :defenses, :body4, :string
  	remove_column :defenses, :body5, :string
  end
end
