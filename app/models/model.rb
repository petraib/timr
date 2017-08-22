class Model < ApplicationRecord
  # Direct associations

  has_many   :variables,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :indicators,
             :through => :variables,
             :source => :indicator

  # Validations

end
