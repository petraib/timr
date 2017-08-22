class Author < ApplicationRecord
  # Direct associations

  has_many   :sources,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
