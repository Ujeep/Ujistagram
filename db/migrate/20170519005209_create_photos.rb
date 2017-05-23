class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
t.content :hash
t.string :image
      t.timestamps null: false
    end
  end
end
