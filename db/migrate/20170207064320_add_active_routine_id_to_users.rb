class AddActiveRoutineIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_routine_id, :integer
    add_index :users, :active_routine_id
  end
end
