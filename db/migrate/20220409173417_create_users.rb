class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # Probably better be unique but it's a test assigment so lets leave it as is
      t.string :name, null: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
