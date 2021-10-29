class AddColumnChildrenCountInComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :children_count, :integer
  end
end
