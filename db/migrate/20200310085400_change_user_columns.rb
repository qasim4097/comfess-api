class ChangeUserColumns < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :nickname, :string, null: false
    remove_column :users, :name, :string
    add_index :users, :nickname, unique: true
  end

  def down
    change_column :users, :nickname, :string, null: true
    add_column :users, :name, :string
    remove_index :users, :nickname
  end
end
