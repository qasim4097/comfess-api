class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.references :user, foreign_key: true
      t.references :reactable, polymorphic: true, null: false
      t.string :type

      t.timestamps
    end

    add_index :reactions, [:user_id, :reactable_id, :reactable_type], unique: true
  end
end
