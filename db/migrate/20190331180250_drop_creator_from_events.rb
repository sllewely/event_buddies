class DropCreatorFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :creator_id
  end
end
