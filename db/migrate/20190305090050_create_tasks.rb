class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :list, foreign_key: true
      t.string :name, null: false, default: ''
      t.integer :status,null: false

      t.timestamps
    end
    add_index :tasks, :status
  end
end
