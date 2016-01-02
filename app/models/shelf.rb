class Shelf < ActiveRecord::Base
  # MODULES
  include ActiveConcerns

  # ASSOCIATIONS
  has_many :binders, -> { order :name }

  # SCOPES
  # VALIDATIONS
  # CALL BACKS
  # CLASS METHODS
  # INSTANCE METHODS
end
