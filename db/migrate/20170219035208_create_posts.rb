class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :post_id
      t.string :timestamp
      t.date :date
      t.string :name
      t.string :face
      t.text :comment
      t.string :link
      t.string :picture_url
      t.string :full_picture_url
      t.boolean :has_picture
      t.boolean :has_video
      t.boolean :has_attachment
      t.text :other

      t.timestamps null: false
    end
  end
end
