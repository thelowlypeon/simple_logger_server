class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :key
      t.boolean :enabled, null: false, default: true
    end
  end
end
