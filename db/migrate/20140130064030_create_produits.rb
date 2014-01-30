class CreateProduits < ActiveRecord::Migration
  def change
    create_table :produits do |t|
      t.string :nom
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
