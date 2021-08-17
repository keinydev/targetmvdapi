class AddAllowPasswordChangeToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :allow_password_change, :boolean, default: false, null: false
  end

  def down 
    remove_columns :users, :allow_password_change
  end
end
