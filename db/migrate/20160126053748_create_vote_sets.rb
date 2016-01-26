class CreateVoteSets < ActiveRecord::Migration
  def change
    create_table :vote_sets do |t|
      t.references :noodle, index: true
      t.text :name

      t.timestamps null: false
    end
    add_foreign_key :vote_sets, :noodles
  end
end
