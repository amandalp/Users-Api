class AddCheckedColumnToDefenses < ActiveRecord::Migration
  def change
  	add_column :defenses, :isChecked, :boolean
  end
end
