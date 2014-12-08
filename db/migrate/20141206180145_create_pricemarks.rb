class CreatePricemarks < ActiveRecord::Migration
  def change
    create_table :pricemarks do |t|
      t.text :url
      t.references :user, index: true
      t.references :topic, index: true

      t.timestamps
    end
  end
end
