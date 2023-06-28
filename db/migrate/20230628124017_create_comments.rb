class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :posts, null: false, foreign_key: true
      t.references :author, foreign_key: { to_table: :users }
      t.text :text

      t.timestamps
    end
  end
end
