class AddUserRefToRoutines < ActiveRecord::Migration
  def change
    add_reference :routines, :user, index: true, foreign_key: true
  end
end
