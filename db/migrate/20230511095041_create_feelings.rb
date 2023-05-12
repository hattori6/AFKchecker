class CreateFeelings < ActiveRecord::Migration[6.1]
  def change
    create_table :feelings do |t|

      t.timestamps

      t.string :feeling, null: false
    end
  end
end
