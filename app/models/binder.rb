class Binder < ActiveRecord::Base
  # MODULES
  include ActiveConcerns

  # ASSOCIATIONS
  has_many :notebooks, -> { order :id }

  # SCOPES
  # VALIDATIONS
  # CALL BACKS
  # CLASS METHODS
  # INSTANCE METHODS
end