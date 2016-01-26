class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :vote_set, index: true
      t.references :option, index: true
      t.integer :value, limit: 2

      t.timestamps null: false
    end
    add_foreign_key :votes, :vote_sets
    add_foreign_key :votes, :options
  end
end
