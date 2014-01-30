class AddAttachmentImageToProduits < ActiveRecord::Migration
  def self.up
    change_table :produits do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :produits, :image
  end
end
