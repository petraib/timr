class AddValueCountToIndicators < ActiveRecord::Migration[5.0]
  def change
    add_column :indicators, :values_count, :integer
  end
end
