class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
      t.integer :group_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
