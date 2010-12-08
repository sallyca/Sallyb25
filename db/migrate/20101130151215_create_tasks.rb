class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :task
      t.boolean :ready
      t.datetime :duedate

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
