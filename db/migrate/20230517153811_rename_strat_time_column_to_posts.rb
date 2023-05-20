class RenameStratTimeColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :strat_time, :start_time
  end
end
