class AddPositionToPorts < ActiveRecord::Migration[5.0]
  def change
    add_column :ports, :position, :integer
  end
end
