class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :text
      t.references :noodle, index: true

      t.timestamps null: false
    end
    add_foreign_key :options, :noodles
  end
end
