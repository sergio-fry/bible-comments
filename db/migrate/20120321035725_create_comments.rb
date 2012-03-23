class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :comment
      t.string :bible_links

      t.timestamps
    end
  end
end
