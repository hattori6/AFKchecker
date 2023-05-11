class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      
      t.integer :genre_id
    end
  end
end
