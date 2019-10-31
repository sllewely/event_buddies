class EventNameDateTimeNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :name, :string, null: false
    change_column :events, :date_time, :datetime, null: false
  end
end
