class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps

      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.integer :feeling_id, null: false
      t.time :start_time
      t.time :finish_time
      t.text :oneword
      t.integer :status , null: false, default: 0
    end
  end
end
