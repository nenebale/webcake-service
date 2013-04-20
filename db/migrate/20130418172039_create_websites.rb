class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :uri
      t.integer :customer_id
      t.timestamps
    end
  end
end
