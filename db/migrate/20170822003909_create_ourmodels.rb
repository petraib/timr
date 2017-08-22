class CreateOurmodels < ActiveRecord::Migration
  def change
    create_table :ourmodels do |t|
      t.string :model_weight
      t.string :ourmodel_name

      t.timestamps

    end
  end
end
