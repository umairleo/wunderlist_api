class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :user, foreign_key: true
      t.string :token, null: false, default: ''
      t.boolean :status, default: true

      t.timestamps
    end
    add_index :sessions, :token, unique: true
  end
end
