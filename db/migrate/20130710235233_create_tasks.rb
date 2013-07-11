class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :completed, default: false

      t.timestamps
    end

    add_index :tasks, :completed
  end
end
