class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.string :address
      t.string :longitude
      t.string :latitude
      t.text :description

      t.timestamps
    end
  end
end
