class Value < ApplicationRecord
  # Direct associations

  belongs_to :indicator,
             :counter_cache => true

  # Indirect associations

  # Validations

end
