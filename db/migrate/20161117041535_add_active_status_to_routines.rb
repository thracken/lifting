class AddActiveStatusToRoutines < ActiveRecord::Migration
  def change
    add_column :routines, :active_status, :integer, default: 0
  end
end
