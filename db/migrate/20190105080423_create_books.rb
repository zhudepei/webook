class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :isbn
      t.string :press
      t.integer :status, null: false, default: 0
      t.integer :price, null: false, default: 0
      t.integer :pages, null: false, default: 0
      t.text :summary, null: false
      t.date :published_at


      t.timestamps
    end
  end
end
