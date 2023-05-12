class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps

      t.integer :genre_id, null: false
      t.integer :feeling_id, null: false
      t.time :strat_time
      t.time :finish_time
      t.text :oneword
      t.integer :status , null: false, default: 0
    end
  end
end
