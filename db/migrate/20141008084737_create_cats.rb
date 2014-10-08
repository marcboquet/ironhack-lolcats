class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.datetime :birth_date

      t.timestamps
    end
  end
end
