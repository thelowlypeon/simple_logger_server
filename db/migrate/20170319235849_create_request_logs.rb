class CreateRequestLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :request_logs do |t|
      t.references :application, null: false
      t.string :method
      t.string :path
      t.string :query
      t.integer :status
      t.column :remote_ip, :cidr
      t.string :user_agent
      t.string :language
      t.string :referrer
      t.string :request_uri
      t.json :custom_fields
      t.datetime :timestamp, null: false
    end
  end
end
