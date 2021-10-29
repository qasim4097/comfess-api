class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.references :post, foreign_key: true
      t.bigint :parent_id

      t.timestamps
    end
  end
end
