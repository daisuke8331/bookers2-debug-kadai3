class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id #フォローするユーザー
      t.integer :followed_id #フォローされるユーザー

      t.timestamps
    end
  end
end
