class Ourmodel < ApplicationRecord
  # Direct associations

  has_many   :variables,
             :dependent => :destroy

  # Indirect associations

  has_many   :indicators,
             :through => :variables,
             :source => :indicator

  # Validations

end
