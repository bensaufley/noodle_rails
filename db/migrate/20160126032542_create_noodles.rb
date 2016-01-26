class CreateNoodles < ActiveRecord::Migration
  def change
    create_table :noodles do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :uuid

      t.timestamps null: false
    end

    add_index :noodles, :uuid, unique: true
  end
end
