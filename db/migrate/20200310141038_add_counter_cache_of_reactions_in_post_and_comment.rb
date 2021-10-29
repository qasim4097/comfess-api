class AddCounterCacheOfReactionsInPostAndComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :hearts_count, :integer
    add_column :comments, :hugs_count, :integer
    add_column :comments, :claps_count, :integer
    add_column :posts, :hearts_count, :integer
    add_column :posts, :hugs_count, :integer
    add_column :posts, :claps_count, :integer
  end
end
