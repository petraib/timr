class Indicator < ApplicationRecord
  # Direct associations

  has_many   :values,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
