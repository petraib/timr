class Source < ApplicationRecord
  # Direct associations

  belongs_to :author

  belongs_to :indicator

  # Indirect associations

  # Validations

end
