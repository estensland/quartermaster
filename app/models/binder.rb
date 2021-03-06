class Binder < ActiveRecord::Base
  # MODULES
  include ActiveConcerns

  # ASSOCIATIONS
  belongs_to :shelf
  has_many :notebooks, -> { order :id }

  # SCOPES
  # VALIDATIONS
  # CALL BACKS
  # CLASS METHODS
  # INSTANCE METHODS
end
