class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :next_action_ids

      t.timestamps
    end
  end
end
