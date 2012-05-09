class AddDraftColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :draft, :boolean, :default => false
  end
end
