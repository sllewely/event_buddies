class AddCreatedByToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :created_by_id, :integer, index: true
  end
end
