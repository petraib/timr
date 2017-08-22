class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :name
      t.string :description
      t.integer :expected_sign
      t.string :database_key

      t.timestamps

    end
  end
end
