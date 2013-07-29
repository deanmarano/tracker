class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :author_id
      t.integer :template_id
      t.text :notes
      t.text :acceptance_criteria
      t.string :title
      t.integer :state_id
      t.integer :index
      t.integer :super_task_id
      t.integer :points

      t.timestamps
    end
  end
end
