class Divider < ActiveRecord::Base
  # MODULES
  include ActiveConcerns

  # ASSOCIATIONS
  belongs_to :notebook
  belongs_to :parent, polymorphic: true
  has_many :children, as: :parent, class_name: 'Divider'
  has_many :notes

  # SCOPES
  # VALIDATIONS
  # CALL BACKS
  # CLASS METHODS
  # INSTANCE METHODS
end
