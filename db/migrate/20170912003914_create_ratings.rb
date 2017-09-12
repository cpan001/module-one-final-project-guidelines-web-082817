class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :star_rating, :default => nil
      t.boolean :fav, :default => nil
      t.belongs_to :user, index: true
      t.belongs_to :recipe, index: true
      t.timestamps
    end
  end
end
