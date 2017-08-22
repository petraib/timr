class Author < ApplicationRecord
  # Direct associations

  has_many   :sources,
             :dependent => :destroy

  # Indirect associations

  has_many   :indicators,
             :through => :sources,
             :source => :indicator

  # Validations

end
