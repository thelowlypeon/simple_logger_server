class CreateErrorLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :error_logs do |t|
      t.references :application, null: false
      t.string :name
      t.string :message
      t.text :backtrace
      t.datetime :timestamp, null: false
    end
  end
end
