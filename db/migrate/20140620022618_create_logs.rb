class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :msg
      t.string :user
      t.integer :pid
      t.string :host
      t.string :rhost
      t.timestamp :logtime

      t.timestamps
    end
  end
end
