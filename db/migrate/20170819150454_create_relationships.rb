class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, foreign_key: true
      t.integer :following_id, foreign_key: true

      t.timestamps
    end
  end
end
