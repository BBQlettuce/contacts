class AddIndexToContactUserId < ActiveRecord::Migration
  def change
    add_index :contacts, :user_id, unique: true
  end
end
