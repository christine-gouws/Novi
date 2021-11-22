class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :followable, polymorphic: true, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
