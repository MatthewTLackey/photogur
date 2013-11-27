class CreateCommenters < ActiveRecord::Migration
  def change
    create_table :commenters do |t|
      t.string :name

      t.timestamps
    end
  end
end
