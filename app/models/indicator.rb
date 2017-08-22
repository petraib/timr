class Indicator < ApplicationRecord
  # Direct associations

  has_many   :variables,
             :dependent => :destroy

  has_many   :sources,
             :dependent => :destroy

  has_many   :values,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
