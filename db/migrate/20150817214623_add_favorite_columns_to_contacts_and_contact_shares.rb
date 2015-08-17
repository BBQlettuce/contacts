class AddFavoriteColumnsToContactsAndContactShares < ActiveRecord::Migration
  def change
    [:contacts, :contact_shares].each do |model|
      add_column model, :favorite, :boolean, default: false
    end
  end
  
end
