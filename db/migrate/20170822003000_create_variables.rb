class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.integer :indicator_id
      t.integer :model_id
      t.string :weight
      t.integer :ourmodel_id

      t.timestamps

    end
  end
end
