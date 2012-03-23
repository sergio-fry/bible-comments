class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :identity
      t.string :provider
      t.text :open_id_data

      t.timestamps
    end

    add_index :users, [:identity, :provider], :unique => true, :name => :user_identity
  end
end
