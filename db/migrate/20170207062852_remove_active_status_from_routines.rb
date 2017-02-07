class RemoveActiveStatusFromRoutines < ActiveRecord::Migration
  def change
    remove_column :routines, :active_status, :integer
  end
end
