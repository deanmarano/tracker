class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :icon
      t.string :point_scale
      t.string :options

      t.timestamps
    end
  end
end