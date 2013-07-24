class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :cause
      t.string :name
      t.integer :resulting_state_id

      t.timestamps
    end
  end
end
