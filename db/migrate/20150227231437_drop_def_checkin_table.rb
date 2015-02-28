class DropDefCheckinTable < ActiveRecord::Migration
  def change
  	drop_table :def_checkins
  end
end
