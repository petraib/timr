class Ourmodel < ApplicationRecord
  # Direct associations

  has_many   :variables,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
