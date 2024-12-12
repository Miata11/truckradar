class AddRealTimeTrackingToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :real_time_tracking, :boolean
  end
end
