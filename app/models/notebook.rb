class Notebook < ActiveRecord::Base
    # MODULES
  include ActiveConcerns

  # ASSOCIATIONS
  has_many :children, as: :parent, class_name: 'Divider'

  # SCOPES
  # VALIDATIONS
  # CALL BACKS
  # CLASS METHODS
  # INSTANCE METHODS
end
