class Indicator < ApplicationRecord
  # Direct associations

  has_many   :variables,
             :dependent => :destroy

  has_many   :sources,
             :dependent => :destroy

  has_many   :values,
             :dependent => :destroy

  # Indirect associations

  has_many   :ourmodels,
             :through => :variables,
             :source => :ourmodel

  has_many   :models,
             :through => :variables,
             :source => :model

  has_many   :authors,
             :through => :sources,
             :source => :author

  # Validations

end
