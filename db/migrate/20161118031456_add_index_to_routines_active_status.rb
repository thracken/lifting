class AddIndexToRoutinesActiveStatus < ActiveRecord::Migration
  def change
    add_index :routines, :active_status
  end
end
