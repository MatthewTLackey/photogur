class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :picture_id
      t.string :content
      t.string :username

      t.timestamps
    end
  end
end
