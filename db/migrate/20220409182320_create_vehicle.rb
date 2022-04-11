class CreateVehicle < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :states_data, default: [], array: true
      t.integer :current_state_index, default: 0

      t.timestamps
    end
  end
end
