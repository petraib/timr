class Variable < ApplicationRecord
  # Direct associations

  belongs_to :model

  belongs_to :indicator

  # Indirect associations

  # Validations

end
