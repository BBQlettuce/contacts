class RemoveIndexOnContactsUserId < ActiveRecord::Migration
  def change
    remove_index(:contacts, :name => "index_contacts_on_user_id")
    add_index :contacts, :user_id
  end
end
